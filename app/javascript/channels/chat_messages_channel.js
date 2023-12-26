import consumer from "channels/consumer"

consumer.subscriptions.create("ChatMessagesChannel", {
  connected() {
    console.log('channel connected');
  },

  disconnected() {
  },

  received(data) {
    console.log(data);

    const frame = document.getElementById(`chat_messages_${data.chat_id}`);
    if (frame) {
      const turboStream = Turbo.renderStreamMessage(data);
      frame.appendChild(turboStream);
    }
  }
});
