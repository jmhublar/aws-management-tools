# AWS Instance Tagging Script

This repository contains a script for tagging AWS instances based on their names. The script uses the AWS CLI to find instances that match a given name pattern and either add specified tags to them, remove specified tags, or list their current tags.

## Prerequisites

- AWS CLI v2 installed and configured with the appropriate permissions to describe instances and create tags. You can find the instructions for installing the AWS CLI [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html).

## Usage

1. Clone the repository to your local machine.
2. Navigate to the repository's directory.
3. Make the script executable by running the following command:

```bash
chmod +x tag_instances.sh
```

4. To add tags, run the script with the instance name pattern, tag key, and tag value as parameters:

```bash
./tag_instances.sh sbx-east-1 Environment Test
```

Replace `sbx-east-1` with your instance name pattern. Replace `Environment` with your desired tag key and `Test` with your desired tag value. The script will tag all instances that have a name starting with the provided parameter with the provided tag and print to stdout what is being done.

5. To remove tags, run the script with the instance name pattern and tag key as parameters:

```bash
./tag_instances.sh sbx-east-1 Environment
```

Replace `sbx-east-1` with your instance name pattern. Replace `Environment` with the tag key you want to remove. The script will remove the specified tag from all instances that have a name starting with the provided parameter and print to stdout what is being done.

6. To list all instances and their current tags, run the script with only the instance name pattern as a parameter:

```bash
./tag_instances.sh sbx-east-1
```

Replace `sbx-east-1` with your instance name pattern. The script will list all instances that have a name starting with the provided parameter and their current tags.

## Contributing

Contributions are welcome. Please submit a pull request.