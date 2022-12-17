# storeapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

child: Text(
categories[index],
style: TextStyle(
color: index == 0 ? Colors.white : Colors.black,
fontSize: 20,
),
),
),
),
);
}

AppBar _buildAppBar() {
return AppBar(
backgroundColor: Colors.purple,
centerTitle: true,
iconTheme: const IconThemeData(color: Colors.white),
leading: const BackButton(),
elevation: 0,
title: const Text(
"STORE",
style: TextStyle(color: Colors.white),
),
actions: [
IconButton(
onPressed: () {},
icon: const Icon(Icons.notifications_none_outlined)),
IconButton(
onPressed: () {
Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPage(),));
}, icon: const Icon(Icons.shopping_cart_outlined)),
],
);
}
}
