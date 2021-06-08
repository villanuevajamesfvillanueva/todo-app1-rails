const draggables = document.querySelectorAll('.draggable');
const statuses = document.querySelectorAll('.status');
const taskCounters = document.querySelectorAll('.task-counter');

draggables.forEach(draggable => {
    draggable.addEventListener('dragstart', () => {
        draggable.classList.add('dragging');
    });
    draggable.addEventListener('dragend', () => {
        draggable.classList.remove('dragging');

        const task =  { status: draggable.parentElement.id };
        fetch('tasks/update_status/' + draggable.id, {
            method: 'PATCH',
            headers: { 'Content-Type': 'application/json',
                        'Accept': 'application/json' },
            body: JSON.stringify(task)
        })

        statuses.forEach(status => {
            var count = status.childElementCount - 1;
            const counter = status.firstElementChild.lastElementChild
            counter.innerHTML = count;
        });
        //not a good practice? i think it's better if count comes from server since there should only be one source of truth
    
    });
});

statuses.forEach(status => {
    status.addEventListener('dragover', e => {
        e.preventDefault();
        const afterElement = getDragAfterElement(status, e.clientY);
        const draggable = document.querySelector('.dragging');
        if (afterElement == null) status.appendChild(draggable);
        else status.insertBefore(draggable, afterElement);
    });
});

function getDragAfterElement(container, y) {
    const draggableElements = [...container.querySelectorAll('.draggable:not(.dragging)')];

    return draggableElements.reduce((closest, child) => {
        const box = child.getBoundingClientRect();
        const offset = y - box.top - box.height / 2;
        if (offset < 0 && offset > closest.offset) {
            return { offset: offset, element: child }
        }
        else {
            return closest;
        }
    }, { offset: Number.NEGATIVE_INFINITY }).element;
}


