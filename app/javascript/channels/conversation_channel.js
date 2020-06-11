import consumer from "./consumer";

const initConversationCable = () => {
  const messagesContainer = document.getElementById('messages-wrapper');
  if (messagesContainer) {
    const id = messagesContainer.dataset.conversationId;
    consumer.subscriptions.create({ channel: "ConversationChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initConversationCable };
