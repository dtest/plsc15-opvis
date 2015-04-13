# PLSC15 Operational Visibility

This is the ansible playbook to set up a t2.micro ec2 instance running MySQL. This instance will be configured to send stats and logs to the demo Operational Visibility Stack

The instances will be contained in a VPC prefixed with PLSC15 in the us-west-1 region. The play will add the required security groups, subnet and keypair. The keypair will be stored in  ~/.ssh/plsc15.pem

# Setting up dependencies

## What dependencies?

Using the ec2 play requires the following dependencies:

- AWS access key
- boto
- ansible

### Setting up AWS access keys
If you do not have an IAM user with AWS Access Keys setup, go to your AWS account and do so. Your user needs access to launch VPC, subnets, security groups, ec2, create key pairs, etc.

Copy the credentials to the ```~/.aws/credentials``` file, and it should look something like this:

```ini
[default]
aws_access_key_id = XXXXXXXXX
aws_secret_access_key = XXXXXXXXX
```

### Setting up boto

If you have not installed boto, you can do so with the following commands:

```bash
$ sudo easy_install pip
$ sudo pip install boto
```

### Setting up ansible

#### On a Mac with Homebrew
```bash
$ brew install ansible
```

#### Using pip
```bash
$ sudo pip install ansible
```

# Setup the instances

To run, type the following from inside the plsc15-opvis directory:

```bash
$ ./setup.sh
```

# Log in to the instances

To log in to the instances, use the plsc15.pem keypair and ubuntu user:

```bash
$ ssh -i ~/.ssh/plsc15.pem ubuntu@$IP
$ sudo su -
```

# Notices

### BOTO Profiles

If you are running on a laptop with many AWS access credentials, you will need to replace your ~/.aws/credentials [default] section with the credentials you want to use for this tutorial.

While boto 2.24 version provides the ability to utilize multiple profiles, ansible's ec2.py dynamic inventory script does not support this, nor does the ec2_vpc module. Many other modules do support profiles, but until ec2.py dynamic inventory does, it is not quite useable.

At the time of these script creation, this was not available in ec2.py. See google discussion: https://groups.google.com/forum/#!searchin/ansible-project/ec2.py$20multiple$20credentials/ansible-project/vk9ovyR3fRM/QFYAQUTdhSsJ

