import 'package:country_pickers/country.dart';
import 'package:flutter/cupertino.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; 
import 'package:flutter/services.dart'; 
import 'package:country_pickers/country_pickers.dart';




void main() => runApp(
  MaterialApp(
   home: MyApp(),
    debugShowCheckedModeBanner: false,
  )
);
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final formkey = GlobalKey <FormState>();
  String phoneNumber;
void validateAndSave(){ final form = formkey.currentState;
if(form.validate()){ print('Forme is valid');} else { print('Forme is not valid');}
}
  
  String confirmedNumber = '';
String _validatePhoneNumber(String value){ 
  final phoneExp = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
if (!phoneExp.hasMatch(value)) { return ' ENTRER UN NUMERO VALIDE';

}
if (value.length == 0 ) {
      return'VEUILLEZ ENTRER UN NUMERO SVP';
      
}return null ;  }
  
Widget _buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(
              width: 4.0,
            ),
            Text("+${country.phoneCode}(${country.isoCode})"),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
      
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/mer.jpeg"), fit: BoxFit.cover)),
          ),Center(
    child:new Container(
    height: 500.00,
    width: 360.00,
    /*alignment:Alignment.*/
    decoration: BoxDecoration(
    color: Color(0xfff2e9db).withAlpha(100),
    boxShadow: [
    BoxShadow(
    offset: Offset(24.00,24.00),
    color: Color(0xffd9cebf).withAlpha(40),
    blurRadius: 42,
    ),
    ], borderRadius: BorderRadius.circular(50.00),
    ),
          
    ),
       
          
          
    
    ),
    
    
       Container(
            height: double.infinity,
               child: SingleChildScrollView(
                 physics: AlwaysScrollableScrollPhysics(),
                 padding: EdgeInsets.symmetric(
                   horizontal: 40.0,
                   vertical: 120.0,
                 ),
                 child:Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     SizedBox( height: 30.0),
                     new Text(
                       "C'est quoi votre numéro ?",
                       style: TextStyle(
                         fontFamily: "Segoe UI",fontWeight: FontWeight.w700,
                         fontSize: 27,
                         color:Color(0xffffffff),
                              
                       shadows:[
                           Shadow(
                             offset: Offset(0.00,3.00),
                             color: Color(0xffff8700),
                             blurRadius: 6,
                           ),
                         ],
                       ),textAlign:TextAlign.center,
                     ),
                     SizedBox(
                       height:80.0,
                     ), 
                     Form(
                       key : formkey,
                     child:Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         
                      
                      Center( child:  Container(
                           alignment: Alignment.centerLeft,
                           
                          
                           decoration: BoxDecoration(
                               color: Colors.white,
                               
                               borderRadius: BorderRadius.circular(30.0),
                               boxShadow: [
                                 BoxShadow(
                                   color: Colors.black12,
                                   blurRadius: 6.0,
                                   offset: Offset(0,2 ),
                                 ),
                               ],),
                           height: 60.0,
                            width: 340,
                          child:
                          Row(
          children: <Widget>[
            SizedBox( height:3.0), 
            Expanded(
              child: CountryPickerDropdown(
                
                itemBuilder: _buildDropdownItem,
                onValuePicked: (Country country) {
                  print("${country.name}");
                },
              ),
            ),
            SizedBox( height:3.0), 
            Expanded(
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,),
                 focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,),
                  hintText: "Téléphone",
                  hintStyle: TextStyle(
                                 color: Color(0xff739D84),
                                 letterSpacing: 1.5,
                                 fontSize: 18.0,
                )),
                onChanged: (value) {
                  // this.phoneNo=value;
                  print(value);
                },
              ),
            ),
          ],
        ),/*TextFormField(keyboardType: TextInputType.phone,
                             style: TextStyle(
                               color:Color(0xff739D84)  ),
                             decoration: InputDecoration(
                             border: InputBorder.none,
                               contentPadding: EdgeInsets.only(top: 15.0),
                              
                               prefixIcon: Icon(
                                 Icons.phone,
                                 color:Color(0xff739D84) ,
                               ),
                               hintText: " 00 00-00-00-00 ",
                               
                               hintStyle: TextStyle(
                                 color: Color(0xff739D84),
                                 letterSpacing: 1.5,
                                 fontSize: 18.0,
                               ),             
                              ),
                              validator:_validatePhoneNumber,
                              onSaved: ( String val){phoneNumber = val; },
                              textAlign:TextAlign.center,
                         ),*/
                        ),
                      ),
                         
                       
                     

                     SizedBox(height: 50.0,),
                     

                      
                 Center( child: 
                   Container(
                     padding: EdgeInsets.symmetric(vertical: 25.0),
                  
                     width: 250,
                     child: RaisedButton(
                       elevation: 10.0,
                       onPressed: validateAndSave,
                       padding: EdgeInsets.all(15.0),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30.0),
                       ),
                       color: Color(0xFFF1B97A),
                       child: Text(
                         'CONTINUER',
                         style: TextStyle(
                           color: Color(0xFFE8652D),
                           letterSpacing: 1.5,
                           fontSize: 18.0,
                           fontWeight: FontWeight.bold,
                         ),
                      
                       ),
                     ),
                   ),
                 ),
                       ],
                     ),
                       
                     ),
                   ],
                     

                 ),
       ),
       ),     

          
         Container( padding:EdgeInsets.only(top:670,left:20,bottom:20),
           child : SizedBox( child:
             Text( "nous recueillons vos informations auprés de nos partenaires de confiance afin d'améliorer votre expérience client lorsque vous utilisez nos services. ", style: TextStyle(
                         fontFamily: "Segoe UI",fontWeight: FontWeight.w700,
                         fontSize:12,
                         color:Color(0xffffffff),),
                         textAlign:TextAlign.center,
             ),
             ),                 
            
             ),
    
        ],
      ),
      

    );
    
  }

}