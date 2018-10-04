The Mooqita Worklearn Platform
The worklearn platform powers the Mooqita app. Mooqita is built on Meteor and most of this repository is forked from Mooqita’s Worklearn project page.

Before you begin working
Here is a side-by-side comparison of coffeescript and javascript. This will show you how the syntax compares and helps so much when converting to or from ES6: http://coffeescript.org/#language

Before you install Docker on Windows you must read this: https://docs.docker.com/docker-for-windows/install/#what-to-know-before-you-install

Useful materials:
https://github.com/Mooqita/worklearn/tree/business_ui  
Docker tutorial - https://www.youtube.com/watch?v=ymlWt1MqURY



Local Installation:
Before installing Mooqita, you must install (with admin privileges):
-  Chocolatey
-  Git
-  Meteor
Meteor also requires it's own set of updates and dependencies. I have listed the ones I installed in the order that I installed them, as follows:
meteor npm install --save file-saver mime
meteor npm install --save mime jszip csv-string mathjs request
meteor npm install --save meteor-node-stubs
meteor npm install --save babel-runtime
meteor npm install --save  bcrypt
meteor update --patch


Mongo DB modules:
1. Download Robo 3T from here: https://robomongo.org/download
2. Click through the installer until you see MongoDB Connections window
3. Click create
4. The type is Direct Connection, Name can be anything, address is localhost, port is 3001
5. Click the test button and hopefully be prompted with "Access to the database is available"
6. Connect to the database and open the meteor drop down, right click collections, add collection named "modules"
7. Right click the collection and insert document

