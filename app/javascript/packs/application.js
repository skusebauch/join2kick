
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
// var $  = require( 'jquery' );
// require( 'datatables.net' )( window, $);

import { DataTable } from 'datatables.net';


import "bootstrap";
import { initChatroomCable } from "../channels/chatroom_channel";
//import { initChatroomCableIndex } from "../channels/chatroom_channel";

// filter result page event
//sortable Table

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initFilter } from '../components/filter';
// import { initRenderUser} from '../components/follow_user';

// active star
import { initStar } from '../components/star';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initChatroomCable();
  initFilter();
  initStar();
  // initRenderUser();
});

$(document).on('turbolinks:load', function () {
    $('#dttb').DataTable();
} );

