# apter-tech/ssh-agent

An advanced extension of [webfactory/ssh-agent](https://github.com/webfactory/ssh-agent) that not only manages SSH private key loading but also handles SSH host verification by setting up and cleaning `known_hosts`. This action simplifies secure communication in your workflows by automating host key management with enhanced security checks.

---

## Features

- **SSH Agent Integration**: Extends `webfactory/ssh-agent` to load SSH private keys seamlessly.
- **Host Verification**:
  - Automatically fetches SSH host keys using `ssh-keyscan`.
  - Supports predefined `known_hosts` entries.
  - Warns about potential security risks for unverified keys.
- **Key Type Filtering**: Optionally specify the types of keys to fetch (`ecdsa`, `ed25519`, etc.).
- **Post-Job Cleanup**: Automatically removes added host entries after the job completes.

---

## Usage

Here’s how to integrate the `apter-tech/ssh-agent` action into your GitHub workflows:

### Basic Example

```yaml
name: Example Workflow
on: [push, pull_request]

jobs:
  example:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
      - name: Setup SSH Agent and Host Verification
        uses: apter-tech/ssh-agent@v1
        with:
          ssh-private-key: ${{ secrets.SSH_PRIVATE_KEY }}
          ssh-host: github.com
          ssh-key-type: ed25519
```

## Inputs

### New Inputs

| Name            	| Description                                                                                             	| Required 	| Default   	|
|-------------------|-----------------------------------------------------------------------------------------------------------|-----------|---------------|
| ssh-host        	| Hostname to fetch SSH keys from using `ssh-keyscan`.                                                    	| No       	|           	|
| ssh-key-type    	| Specify the type of key to fetch. Possible values: `ecdsa`, `ed25519`, `ecdsa-sk`, `ed25519-sk`, `rsa`. 	| No       	| All types 	|
| ssh-known-hosts 	| Predefined `known_hosts` entries. If provided, skips `ssh-keyscan`.                                     	| No       	|           	|

### Inherited Inputs from `webfactory/ssh-agent`

| Name               | Description                                     | Required | Default |
|--------------------|-------------------------------------------------|----------|---------|
| `ssh-private-key`  | Private SSH key to register in the SSH agent.   | Yes      |         |
| `ssh-auth-sock`    | Location of the SSH agent auth socket.          | No       |         |
| `log-public-key`   | Log public key fingerprints.                    | No       | true    |
| `ssh-agent-cmd`    | Command to start the SSH agent.                 | No       |         |
| `ssh-add-cmd`      | Command to add the SSH key to the agent.        | No       |         |
| `git-cmd`          | Command to use for Git operations.              | No       |         |

## Security Considerations

### Host Key Verification
- **Recommended:** Always verify host keys manually before using `ssh-keyscan`.
- **Warnings:** The action emits warnings if unverified host keys are used, as they pose a risk of man-in-the-middle attacks.

## How It Works

**1. Main Workflow:**

- Loads the SSH private key using `webfactory/ssh-agent`.
- Configures `known_hosts`:
  - Uses predefined entries if `ssh-known-hosts` is set.
  - Fetches host keys using `ssh-keyscan` if `ssh-host` is provided.

**2.	Post-Job Cleanup:**

- Removes the last added entry from known_hosts to keep the environment clean.

## Example with Predefined Known Hosts

```yaml
- name: Setup SSH Agent with Predefined Known Hosts
  uses: apter-tech/ssh-agent@v1
  with:
    ssh-private-key: ${{ secrets.SSH_PRIVATE_KEY }}
    ssh-known-hosts: |
      github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGh4DoiJkCQJklXG3zjGhheklNSklai38skjdjz89
```

## Development

### Scripts Overview
- `action.sh`: Main script for handling SSH host setup.
- `post_action.sh`: Cleanup script to remove temporary host entries.

## Contributing

Contributions are welcome! Please open issues or submit pull requests to improve the functionality or documentation.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.