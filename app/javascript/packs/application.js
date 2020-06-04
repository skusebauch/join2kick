
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


import "bootstrap";
import { initChatroomCable } from "../channels/chatroom_channel";
//import { initChatroomCableIndex } from "../channels/chatroom_channel";

//sortable Table

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { initFilter } from '../components/filter';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initChatroomCable();
  initUpdateNavbarOnScroll();
  initFilter();
});



