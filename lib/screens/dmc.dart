import 'package:flutter/material.dart';

class Dmc extends StatefulWidget {
  const Dmc({Key? key}) : super(key: key);

  @override
  State<Dmc> createState() => _DmcState();
}

class _DmcState extends State<Dmc> {

  var formKey = GlobalKey<FormState>();
  late int eng, phy, math, sci, geo;
  var obtMarks = '';
  var percentage = '';
  var grade = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'English',
                      labelText: 'English Marks',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'please provide english marks';
                    } else {
                      eng = int.parse(text);
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Physics',
                      labelText: 'Physics Marks',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'please provide physics marks';
                    } else {
                      phy = int.parse(text);
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Maths',
                      labelText: 'Maths Marks',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'please provide math marks';
                    } else {
                      math = int.parse(text);
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Science',
                      labelText: 'Science Marks',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'please provide science marks';
                    } else {
                      sci = int.parse(text);
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Geography',
                      labelText: 'Geography Marks',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'please provide geography marks';
                    } else {
                      geo = int.parse(text);
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            onPressed: () {
                              formKey.currentState!.reset();
                              obtMarks = '';
                              percentage = '';
                              grade = '';
                              setState(() {

                              });
                            },
                            child: const Text('Clear'))),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                int obt = eng + phy + math + sci + geo;
                                double per = obt * 100 / 500;

                                if (per >= 80) {
                                  grade = 'A1';
                                } else if (per >= 70) {
                                  grade = 'A';
                                } else if (per >= 60) {
                                  grade = 'B';
                                } else if (per >= 40) {
                                  grade = 'C';
                                } else {
                                  grade = 'Fail';
                                }

                                setState(() {
                                  obtMarks = obt.toString();
                                  percentage = per.toString();
                                });
                              }
                            },
                            child: const Text('Calculate'))),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text('Obtained Marks: $obtMarks'),
                const SizedBox(
                  height: 16,
                ),
                Text('Percentage: $percentage'),
                const SizedBox(
                  height: 16,
                ),
                Text('Grade: $grade')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
