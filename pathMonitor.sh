# kill old progress
echo "*************1. kill old progress****************"

# update code
echo "*************2. update code****************"
git pull
echo "*************3. npm install****************"
npm install
# run
echo "*************4. run****************"
npm run dev
