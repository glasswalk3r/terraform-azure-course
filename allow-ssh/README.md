# allow-ssh

Simple module that creates a `azurerm_network_security_group` resource to allow
SSH connections to a VM.

## How to use

1 - Import the module.
2 - Pass the required variables.
3 - Add a `depends_on` meta argument to avoid a known error, like the example
below.

```
  depends_on = [
    azurerm_network_interface.demo-instance
  ]
```

Otherwise you might get errors like this one:


```
   Error: deleting Network Security Group "demo-allow-ssh" (Resource Group
   "first-steps-demo"): network.SecurityGroupsClient#Delete: Failure sending
   request: StatusCode=400 -- Original Error:
   Code="NetworkSecurityGroupOldReferencesNotCleanedUp" Message="Network
   security group demo-allow-ssh cannot be deleted because old references for
   the following Nics:
```
