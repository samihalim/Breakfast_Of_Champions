import consumer from "./consumer";

const initChatroomCable = () => {
  const flagContainer = document.getElementById('flag-container');
  if (flagContainer) {
    const id = flagContainer.dataset.chatroomId;
    console.log('found')
    consumer.subscriptions.create({ channel: "UserChannel", id: id },{
      connected() {
        console.log('connected');
      },
      received(data) {
        console.log(data)
        flagContainer.style.background = '#FFDD99';

         // called when data is broadcast in the cable
      },
    });
  }
}

export { initChatroomCable };


