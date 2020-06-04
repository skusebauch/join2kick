
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


import "bootstrap";
import { initChatroomCable } from "../channels/chatroom_channel";

//sortable Table
import {initSortable} from "../components/table";
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initUpdateNavbarOnScroll } from '../components/navbar';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initChatroomCable();
  initUpdateNavbarOnScroll();
  initSortable();
});



