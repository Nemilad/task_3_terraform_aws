# task_3_terraform_aws

I was trying to setup OWASP ZAP, but aws_instansce stop working properly even if I add "sudo apt-get -y update" to user_data

I was planning to run it like this:

        sudo apt-get -y update
        sudo apt-get -y install docker
        docker pull owasp/zap2docker-stable
        docker run -t owasp/zap2docker-stable zap-baseline.py -t http://$(ip -f inet -o addr show docker0 | awk '{print $4}' | cut -d '/' -f 1):80 -r report.html
        
And to setup crontab to run last line each night
