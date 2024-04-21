import 'package:flutter/material.dart';

class Mainitems extends StatelessWidget {
  const Mainitems({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 140,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Icon(
            icon,
            color: Colors.black45,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.black45),
          )
        ],
      ),
    );
  }
}

class ScrollList extends StatelessWidget {
  const ScrollList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          const SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 80,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1570168007204-dfb528c6958f?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                      fit: BoxFit.fill)),
              //child: Image.network("https://images.unsplash.com/photo-1574169207511-e21a21c8075a?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              //fit: BoxFit.fill,)
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Maraine Lake",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Tuesday 16",
                style: TextStyle(fontWeight: FontWeight.w100),
              ),
              SizedBox(
                height: 3,
              ),
              Text("One of the most wonderful lakes\nin Alberto",
                  style: TextStyle(fontWeight: FontWeight.w100))
            ],
          )
        ],
      ),
    );
  }
}

class PopularImages extends StatelessWidget {
  const PopularImages(
      {super.key,
      required this.placename,
      required this.country,
      required this.rating});
//270 700

  final String placename;
  final String country;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 180,
                width: 165,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1566438480900-0609be27a4be?q=80&w=1894&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                      fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 130),
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 18,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            placename,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(Icons.location_on_outlined),
              const SizedBox(
                width: 2,
              ),
              Text(
                country,
                style: const TextStyle(fontSize: 8),
              ),
              const SizedBox(
                width: 2,
              ),
              const Icon(
                Icons.star_border,
                color: Colors.yellow,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(rating)
            ],
          )
        ],
      ),
    );
  }
}
