import 'package:flutter/material.dart';
import '../dashboard/dashboard_page.dart';
class HealthPage extends StatelessWidget {
  const HealthPage({super.key});
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Gesundheitsakte')), drawer: const _Nav(), body: ListView(padding: const EdgeInsets.all(20), children: [
    _card(Icons.vaccines_outlined, 'Impfungen', 'Tollwut • gültig bis 2027'),
    _card(Icons.medication_outlined, 'Medikamente', 'Keine aktiven Medikamente'),
    _card(Icons.warning_amber_outlined, 'Allergien', 'Keine bekannten Allergien'),
    _card(Icons.calendar_month_outlined, 'Termine', 'Nächster Tierarzttermin: noch nicht geplant'),
  ]));
  Widget _card(IconData i,String t,String s)=>Card(child:ListTile(leading:Icon(i),title:Text(t),subtitle:Text(s),trailing:const Icon(Icons.chevron_right)));
}
class _Nav extends StatelessWidget { const _Nav(); @override Widget build(BuildContext c)=>Drawer(child:ListView(children:[const DrawerHeader(child:Text('DogGuard',style:TextStyle(fontSize:24,fontWeight:FontWeight.bold))),ListTile(title:const Text('Dashboard'),onTap:()=>Navigator.pushReplacement(c,MaterialPageRoute(builder:(_)=>const DashboardPage()))) ]));}
