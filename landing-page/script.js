
const list = document.getElementById('todo-list');
const input = document.getElementById('todo-input');
const resetBtn = document.getElementById('reset-btn');

function loadTodos() {
  const raw = localStorage.getItem('violet_todos');
  if (raw) {
    const items = JSON.parse(raw);
    list.innerHTML = '';
    items.forEach(item => {
      const li = document.createElement('li');
      const cb = document.createElement('input');
      cb.type = 'checkbox';
      cb.checked = item.done;
      cb.onchange = () => {
        item.done = cb.checked;
        saveTodos();
      };
      li.appendChild(cb);
      li.appendChild(document.createTextNode(item.text));
      list.appendChild(li);
    });
  }
}

function saveTodos() {
  const items = Array.from(list.children).map(li => {
    const cb = li.querySelector('input[type=checkbox]');
    return { text: li.textContent.trim(), done: cb.checked };
  });
  localStorage.setItem('violet_todos', JSON.stringify(items));
}

// reset localstorage when button is pressed
resetBtn.addEventListener('click', () => {
    localStorage.removeItem('violet_todos');
    list.innerHTML = '';
});

input.addEventListener('change', () => {
  const lines = input.value.split('\n').filter(Boolean);
  lines.forEach(line => {
    const li = document.createElement('li');
    const cb = document.createElement('input');
    cb.type = 'checkbox';
    cb.onchange = saveTodos;
    li.appendChild(cb);
    li.appendChild(document.createTextNode(line));
    list.appendChild(li);
  });
  input.value = '';
  saveTodos();
});

loadTodos();
