# Terraform Compliance

Terraform-compliance is a lightweight, security and compliance focused test framework against terraform to enable negative testing capability for your infrastructure-as-code.

## Installation

Use the package manager [pip](https://pypi.org/project/terraform-compliance/) to install terraform-compliance.

```bash
pip install terraform-compliance
```

## Usage
```bash
terraform plan -out=FileName.out
```
After the getting output file Now use terraform compliance

```bash
terraform-compliance -p FileName.out -f terraform-compliance-folder/
```

terraform-compliance-folder is a folder where all feature file are stored.

## Refrence and Owner
[MIT](https://choosealicense.com/licenses/mit/) licence.

[Terraform-Compliance](https://terraform-compliance.com/) 

[Git-Hub](https://github.com/terraform-compliance/cli) Official github repo.
