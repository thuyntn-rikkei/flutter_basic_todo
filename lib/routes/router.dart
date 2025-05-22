
import 'package:go_router/go_router.dart';

import '../presentation/add_new_todo_screen.dart';
import '../presentation/edit_todo_screen.dart';
import '../presentation/todo_list_screen.dart';
import 'Routes.dart';

GoRouter router() => GoRouter(
    initialLocation: Routes.todoList,
    routes: [
      GoRoute(
        path: Routes.todoList,
        builder: (context, state) => const TodoListScreen(),
      ),
      GoRoute(
        path: Routes.addNewTodo,
        builder: (context, state) => const AddNewTodoScreen(),
      ),
      GoRoute(
        path: '${Routes.editTodo}/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'];
          return EditTodoScreen(id: id ?? '');
        },
      ),
    ]
);