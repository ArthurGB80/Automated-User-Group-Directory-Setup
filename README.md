# Automated User Group Directory Setup

This repository contains a script that automates the setup of users, user groups, directories, and permissions on a new virtual machine. The script is designed to be run immediately after a new virtual machine is started, setting up the necessary infrastructure for use.

## Challenge Description

The challenge was to create a script that automatically sets up the infrastructure of users, user groups, directories, and permissions. The script is uploaded to GitHub for future reusability. Thus, every new virtual machine that is started will be ready for use when the script is executed.

## Solution

The provided script creates new directories, groups, and users. It also sets up the necessary permissions for each user and group. The script uses hashed passwords for added security.

## Usage

To use the script, clone this repository and run the script as root on your new virtual machine:
