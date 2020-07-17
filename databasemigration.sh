BASTION_IP=150.136.9.124
TARGET_DB_HOST=10.0.5.2
scp -i ~/.ssh/privatekey  ~/wlsworkshop/WebLogic-to-oci/createSchema.sql opc@${BASTION_IP}:/home/opc/
scp -i ~/.ssh/privatekey -o ProxyCommand="ssh -W %h:%p opc@${BASTION_IP} -i ~/.ssh/privatekey" -r ~/wlsworkshop/WebLogic-to-oci/createSchema.sql opc@${TARGET_DB_HOST}:/home/opc/
ssh -i ~/.ssh/privatekey -o ProxyCommand="ssh -W %h:%p opc@${BASTION_IP} -i ~/.ssh/privatekey" opc@${TARGET_DB_HOST} "sudo chown -R oracle:oinstall /home/opc/createSchema.sql && sudo rm -rf /home/oracle/createSchema.sql && sudo mv /home/opc/createSchema.sql /home/oracle/"
ssh -i ~/.ssh/privatekey -o ProxyCommand="ssh -W %h:%p opc@${BASTION_IP} -i ~/.ssh/privatekey" opc@${TARGET_DB_HOST} "sudo ls -a && sudo su - oracle bash -c "sqlplus""