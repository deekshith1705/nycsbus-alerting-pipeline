# This Terraform configuration sets up an API Gateway to trigger a Lambda function.
resource "aws_api_gateway_rest_api" "this" {
  name = "BusEventAPIv3"
}

# This resource creates a new API Gateway REST API with the specified name.
resource "aws_api_gateway_resource" "resource" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  path_part   = var.resource_path
}

# This resource defines a method for the API Gateway resource, allowing it to handle HTTP requests.
resource "aws_api_gateway_method" "method" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = var.http_method
  authorization = "NONE"
}

# This resource sets up the integration between the API Gateway and the Lambda function.
# It specifies how the API Gateway should invoke the Lambda function when a request is made.
# The integration type is set to AWS_PROXY, allowing the Lambda function to handle the request directly
resource "aws_api_gateway_integration" "integration" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_resource.resource.id
  http_method = aws_api_gateway_method.method.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.lambda_function_arn}/invocations"

}

# This resource grants the API Gateway permission to invoke the specified Lambda function.
# It allows the API Gateway to call the Lambda function when a request is made to the API Gateway.
# The source ARN is constructed to match the API Gateway's execution ARN, ensuring that only this
resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.this.execution_arn}/*/*"
}

# This resource deploys the API Gateway, making it available for use.
# It creates a deployment that can be accessed via the invoke URL.
# The deployment is associated with a specific stage, allowing for versioning and management of the API
resource "aws_api_gateway_deployment" "deployment" {
  depends_on = [aws_api_gateway_integration.integration]
  rest_api_id = aws_api_gateway_rest_api.this.id
}

# This resource creates a stage for the API Gateway deployment.
# A stage is a named reference to a deployment, allowing for different versions of the API to be managed.
# The stage name is set to "prod", indicating that this is the production version of the API.
# The stage is associated with the deployment created earlier, allowing it to be accessed via the invoke
resource "aws_api_gateway_stage" "prod" {
  stage_name    = "prod"
  rest_api_id   = aws_api_gateway_rest_api.this.id
  deployment_id = aws_api_gateway_deployment.deployment.id
}

