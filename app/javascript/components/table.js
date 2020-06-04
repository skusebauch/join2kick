import * as Sortable from "sortablejs";

table1 = document.querySelector('#table1')
const initSortable = ()=> {
  if (table1) {
    Sortable.initTable(table1);
  }
}

export {initSortable}
