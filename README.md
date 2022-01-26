STPFMMP (Simple Terraform Playbook For Managing Multiple PiHoles)
======

If you want to run PiHole on your network but not have the entire family grumble that the internet isn't working when you need to reboot the machine it's running on then you'll need to run two PiHoles. To run two PiHoles properly they need to a) be on separate machines (I use my main homelab server and a RaspberryPi) and b) be configured on your client devices appropriately. __*__

If you've got all that working but have been getting annoyed that adding any new service means duplicating manual configuration steps in a PiHole web interface then this project is for you.

## Usage

  1. Copy `domains.json.dist` to `domains.json` and edit accordingly
  2. Copy `secret.tfvars.dist` to `secret.tfvars` and edit accordingly
  3. Ensure your PiHoles have not already got the entries defined (so delete them if they exist)__**__
  4. `terraform init`
  5. `terraform plan -var-file=secret.tfvars`
  6. `terraform apply -var-file=secret.tfvars`
  7. ~~Profit~~ Be happy that editing your home network DNS is now not so repetitive/dull/error prone.

__*__ If you're using the primary PiHole as a DHCP this is actually fairly easy. Add a new file to the `/etc/dnsmasq.d/` called `07-pihole-dhcp-dns.conf` and in that file add a line like `dhcp-option=6,192.168.100.2,192.168.100.3` (obviously replacing those IP addresses with whatever you're using). Ensure you restart _dnsmasq_. If you're using your router then I'd advise prodding around in whatever setting you have available. Failing that configure your devices manually.

__**__ The terraform provider being used has not yet implemented refresh/import support so the only way to get this to work is to ensure you're running it on a blank canvas. I ran the `apply` step multiple times so that I could remove values from one PiHole instance at a time.