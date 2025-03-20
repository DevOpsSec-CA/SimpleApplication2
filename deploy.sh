sudo apt update && sudo apt install nodejs npm
# Install pm2 (process manager for Node.js)
sudo npm install -g pm2
# Stop runnings instances if necessary
pm2 stop simple_app
# Cd into application directory
cd SimpleApplication/
# Install app dependencies
npm install
# Collects private key and certificate values from repository secrets
echo $PRIVATE_KEY > privatekey.pem
echo $SERVER > server.crt
# Set environment to production
export ENV=PROD
# Start the application using pm2 under name simple_app
pm2 start ./bin/www --name simple_app
# I added the ssh key to GitHub so I am adding this line to push so I can trigger pipeline again and test deployment