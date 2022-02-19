import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:kt_dart/collection.dart';
import 'package:notes_app/appliction/auth/note_form_bloc/note_form_bloc_bloc.dart';
import 'package:notes_app/domain/note/value_object.dart';
import 'package:notes_app/infrastrructure/notes/todo_primitive.dart';
import 'package:notes_app/presentation/notes/note_form/form_todo_extension.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteFormBlocBloc, NoteFormBlocState>(
      listenWhen: (p, c) => p.note.todos.isFull != c.note.todos.isFull,
      listener: (context, state) {
        if (state.note.todos.isFull) {
          FlushbarHelper.createAction(
            message: 'Want Longer List 💋 Activate Premium',
            button: TextButton(
              onPressed: () {},
              child: const Text(
                'Buy Now',
                style: TextStyle(color: Colors.yellow),
              ),
            ),
            duration: const Duration(
              seconds: 1,
            ),
          ).show(context);
        }
      },
      child: Consumer<FormTodo>(
        builder: (context, formTodos, child) {
          return ImplicitlyAnimatedReorderableList<TodoItemPrimitive>(
            shrinkWrap: true,
            removeDuration: Duration.zero,
            items: formTodos.value.asList(),
            areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
            onReorderFinished: (item, from, to, newItems) {
              context.formTodos = newItems.toImmutableList();
              BlocProvider.of<NoteFormBlocBloc>(context).add(
                NoteFormBlocEvent.todosChanged(context.formTodos),
              );
            },
            itemBuilder: (context, itemAnimation, item, index) {
              return Reorderable(
                key: ValueKey(item.id),
                builder: (context, dragAnimation, inDrag) {
                  return ScaleTransition(
                    scale: Tween<double>(begin: 1, end: 0.95)
                        .animate(dragAnimation),
                    child: TodoTile(
                      index: index,
                      elevation: dragAnimation.value * 4,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class TodoTile extends HookWidget {
  final int index;
  final double elevation;
  const TodoTile({Key? key, required this.index, required this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo =
        context.formTodos.getOrElse(index, (_) => TodoItemPrimitive.empty());
    final textControler = useTextEditingController(text: todo.name);

    return Slidable(
      key: ValueKey(index),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.red,
            label: 'DELETE',
            icon: Icons.delete,
            onPressed: (contex) {
              contex.formTodos = contex.formTodos.minusElement(todo);
              BlocProvider.of<NoteFormBlocBloc>(context).add(
                NoteFormBlocEvent.todosChanged(contex.formTodos),
              );
            },
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Material(
          elevation: elevation,
          animationDuration: const Duration(microseconds: 50),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: Checkbox(
                value: todo.done,
                onChanged: (value) {
                  context.formTodos = context.formTodos.map(
                    (listTodo) => listTodo == todo
                        ? todo.copyWith(done: value!)
                        : listTodo,
                  );
                  BlocProvider.of<NoteFormBlocBloc>(context).add(
                    NoteFormBlocEvent.todosChanged(context.formTodos),
                  );
                },
              ),
              trailing: const Handle(
                child: Icon(Icons.list),
              ),
              title: TextFormField(
                controller: textControler,
                decoration: const InputDecoration(
                  hintText: 'Todo',
                  counterText: '',
                  border: InputBorder.none,
                ),
                maxLength: TodoName.max,
                onChanged: (value) {
                  context.formTodos = context.formTodos.map(
                    (listTodo) => listTodo == todo
                        ? todo.copyWith(name: value)
                        : listTodo,
                  );
                  BlocProvider.of<NoteFormBlocBloc>(context).add(
                    NoteFormBlocEvent.todosChanged(context.formTodos),
                  );
                },
                validator: (_) => BlocProvider.of<NoteFormBlocBloc>(context)
                    .state
                    .note
                    .todos
                    .value
                    .fold(
                      (f) => null,
                      (todoList) => todoList[index].name.value.fold(
                            (l) => l.maybeMap(
                              empty: (value) => 'Cannot be Empty',
                              exceedingLength: (value) => 'Too long',
                              multiLine: (value) => 'Has to be Single line',
                              orElse: () {},
                            ),
                            (r) {},
                          ),
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
