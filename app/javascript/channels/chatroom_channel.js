import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    console.log(id);
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        // messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

const initChatroomCableIndex = () => {
  //const currentChatContainer = document.getElementById('current-chat-container');
  const buttonsChat = document.querySelectorAll('#chatroom-button');
  const currentChatContainer = document.getElementById('current-chat-container');
  //console.log(buttonsChat)
  // buttonsChat.forEach((buttonChat) => { console.log("Test")});
  buttonsChat.forEach((buttonChat) => {
    //console.log("Test")
    buttonChat.addEventListener( 'click', (event) => {
      // console.log("Test-Listener")
      if (currentChatContainer) {
        //console.log(buttonChat.dataset.chatroomId)
        currentChatContainer.innerHTML = '';
        const id = buttonChat.dataset.chatroomId;
        consumer.subscriptions.create({ channel: "ChatroomChannel", id: id },
          { received(data){
          console.log(data); // called when data is broadcast in the cable
          //currentChatContainer.insertAdjacentHTML('beforeend', data);
            },
          });
      }
    })
  });
};

export { initChatroomCable };
