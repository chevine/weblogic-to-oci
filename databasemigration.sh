BASTION_IP=
TARGET_DB_HOST=
scp -i ~/wlsworkshop/WebLogic-to-oci/Bob  ~/wlsworkshop/WebLogic-to-oci/Bob opc@${BASTION_IP}:/home/opc/.ssh/
ssh -i ~/wlsworkshop/WebLogic-to-oci/Bob opc@${BASTION_IP} "sudo chmod 400 /home/opc/.ssh/Bob"
scp -i ~/wlsworkshop/WebLogic-to-oci/Bob  ~/wlsworkshop/WebLogic-to-oci/createSchema.sql opc@${BASTION_IP}:/home/opc/
scp -i ~/wlsworkshop/WebLogic-to-oci/Bob -o ProxyCommand="ssh -W %h:%p opc@${BASTION_IP} -i ~/.ssh/Bob" -r ~/wlsworkshop/WebLogic-to-oci/createSchema.sql opc@${TARGET_DB_HOST}:/home/opc/
ssh -i ~/wlsworkshop/WebLogic-to-oci/Bob -o ProxyCommand="ssh -W %h:%p opc@${BASTION_IP} -i ~/.ssh/Bob" opc@${TARGET_DB_HOST} "sudo chown -R oracle:oinstall /home/opc/createSchema.sql && sudo rm -rf /home/oracle/createSchema.sql && sudo mv /home/opc/createSchema.sql /home/oracle/"
ssh -i ~/wlsworkshop/WebLogic-to-oci/Bob -o ProxyCommand="ssh -W %h:%p opc@${BASTION_IP} -i ~/.ssh/Bob" opc@${TARGET_DB_HOST} "sudo ls -a && sudo su - oracle bash -c "sqlplus""