# EKS Scaling Service

This service automatically scales down the managed node groups of non-production EKS clusters to zero. It is implemented as a serverless application using AWS Lambda and is managed with the Serverless Framework.

## Requirements

- Node.js and npm
- Serverless Framework
- AWS account with configured AWS credentials
- Python 3.8

## Deployment

First, install the Serverless Framework globally:

```bash
npm install -g serverless
```

To deploy the service, navigate to the `eks-scaling-service` directory and run:

```bash
serverless deploy --region YOUR_REGION --accountId YOUR_ACCOUNT_ID
```

Replace `YOUR_REGION` and `YOUR_ACCOUNT_ID` with your AWS region and AWS account ID, respectively.