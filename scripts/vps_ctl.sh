echo "# destroying VPS web01"
doctl compute droplet delete --force web01 >/dev/null 2>/dev/null
doctl compute tag create wk

echo "# making new VPS web01"
doctl compute droplet create web01 \
	--region sfo1 --image ubuntu-16-10-x64 --size 512mb \
	--tag-name wk \
	--ssh-keys 99:b4:a2:90:f9:2f:b0:5d:57:bc:c3:dc:04:e1:77:89 --wait
echo "# done"

echo "# listing droplets"
doctl compute droplet list --tag-name wk

##doctl compute floating-ip-action assign 138.68.195.177 web01
