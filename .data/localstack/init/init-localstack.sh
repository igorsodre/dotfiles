#!/bin/bash
set -euo pipefail
unset VIRTUAL_ENV

echo ">> [init] Initializing LocalStack resources..."

ENDPOINT_URL="http://localhost:4566"

# Wait for services to be ready
until curl -s $ENDPOINT_URL/health | grep '"initialized": true' > /dev/null; do
  echo ">> [init] Waiting for LocalStack to be ready..."
  sleep 2
done

echo ">> [init] Creating S3 bucket and uploading file..."
aws --endpoint-url=$ENDPOINT_URL s3 mb s3://demo-bucket || true
aws --endpoint-url=$ENDPOINT_URL s3 mb s3://pathways || true
aws --endpoint-url=$ENDPOINT_URL s3 mb s3://platform || true
echo "Hello, LocalStack!" > /tmp/hello.txt
aws --endpoint-url=$ENDPOINT_URL s3 cp /tmp/hello.txt s3://demo-bucket/

echo ">> [init] Creating KMS key..."
aws --endpoint-url=$ENDPOINT_URL kms create-key \
  --description "Test key" || true

echo ">> [init] Creating SQS queue..."
aws --endpoint-url=$ENDPOINT_URL sqs create-queue --queue-name test-queue || true

echo ">> [init] Creating CloudWatch log group..."
aws --endpoint-url=$ENDPOINT_URL logs create-log-group --log-group-name test-log-group || true

echo ">> [init] Preparing Lambda function..."
LAMBDA_DIR="/opt/code"
LAMBDA_NAME="hello-lambda"
mkdir -p $LAMBDA_DIR
cat > $LAMBDA_DIR/${LAMBDA_NAME}.py <<EOF
def handler(event, context):
    return {
        "statusCode": 200,
        "body": "Hello from LocalStack Lambda!"
    }
EOF

zip -j /tmp/${LAMBDA_NAME}.zip $LAMBDA_DIR/${LAMBDA_NAME}.py

aws --endpoint-url=$ENDPOINT_URL lambda create-function \
  --function-name $LAMBDA_NAME \
  --runtime python3.9 \
  --handler ${LAMBDA_NAME}.handler \
  --role arn:aws:iam::000000000000:role/mock-role \
  --zip-file fileb:///tmp/${LAMBDA_NAME}.zip || true

echo ">> [init] Invoking Lambda..."
aws --endpoint-url=$ENDPOINT_URL lambda invoke \
  --function-name $LAMBDA_NAME \
  /tmp/lambda-output.txt || true

cat /tmp/lambda-output.txt

echo ">> [init] Creating OpenSearch domain..."
aws --endpoint-url=$ENDPOINT_URL opensearch create-domain \
  --domain-name test-domain || true

echo ">> [init] All resources created successfully."
