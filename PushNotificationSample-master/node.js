"use strict";

/**

Send individualised notifications

i.e. Account updates for users with one-or-more device tokens
*/

const apn = require("apn");

let users = [
  { 
    name: "Wendy", 
  "devices": ["a331a4efc021404731c755a9b1916286bb0701c06ceafd2aca0fc4ff7395f585"]}
];

let service = new apn.Provider({
  cert: "cert.pem",
  key: "key.pem",
  production: false
});

users.forEach( (user) => {

  let note = new apn.Notification();
  note.alert = `Hey ${user.name}, I just sent my first Push 
Notification`;

  // The topic is usually the bundle identifier of your application.
  note.topic = "com.exi.exi";
  note.sound = "default"
  note.category =  "MEETING_INVITATION"
  note['title'] = "Hello"
  note.mutableContent = 1

  console.log(`Sending: ${note.compile()} to ${user.devices}`);

  service.send(note, user.devices).then( result => {
      console.log("sent:", result.sent.length);
      console.log("failed:", result.failed.length);
      console.log(result.failed);
  });
});

service.shutdown();
