# Getting started with bolt tasks and plans - example repo

## What is this?

This repo contains some simple bolt configuration and task and plan examples to help you get up and running quickly. Originally presented at PEX Germany 2019 and published by popular demand :-)

## How to use

### Install and configure 

1. [Install bolt](https://puppet.com/docs/bolt/latest/bolt_installing.html)
2. Clone this repo
3. Rename `bolt.example.yaml` to `bolt.yaml` and modify accordingly ([docs](https://puppet.com/docs/bolt/latest/configuring_bolt.html))
4. For ssh or winrm transports: rename `inventory.example.yaml` to `inventory.yaml` and modify accordingly ([docs](https://puppet.com/docs/bolt/latest/inventory_file_v2.html#inventory-file-v2))
5. For pcp transport: rename `inventory.pcp.yaml` to `inventory.yaml` and modify accordingly ([docs](https://puppet.com/docs/bolt/latest/bolt_configuration_options.html#pcp-transport-configuration-options))

### Usage

#### Commands

1. Run a command on all nodes in inventory

   ```bash
   bolt command run hostname -n all
   ```
#### Scripts

1. Run a script on all nodes in inventory

   ```bash
   bolt script run scripts/hello.sh -n all
   ```

#### Tasks

1. Show all available tasks

   ```bash
   bolt task show
   ```

1. Show documentation for a task

   ```bash
   bolt task show my::hello
   ```

1. Check the status of the `httpd` service on all nodes

   ```bash
   bolt task run service -n all action=status name=httpd
   ```

1. Run a task on the linux nodes

   ```bash
   bolt task run my::hello -n linux message="Hello, World"
   ```

1. Run a multi-OS task on all nodes

   ```bash
   bolt task run my::goodbye -n all message="Goodbye, World"
   ```

#### Plans

1. Show all available plans

   ```bash
   bolt plan show
   ```

1. Run a yaml plan

    ```bash
    bolt plan run my::first -n all
    ```

    ```bash
    bolt plan run my::second hello_hosts=linux goodbye_hosts=windows message="Hello, World" --verbose
    ```

1. Convert a yaml plan into a Puppet-language plan

    ```bash
    bolt plan convert site-modules/my/plans/second.yaml > site-modules/my/plans/third.pp
    ```

1. Install and start httpd on all linux nodes

    ```bash
    bolt plan run my::httpd -n linux --verbose
    ```

## Author: dimitri@puppet.com