import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EstateGoogle extends StatefulWidget {
  const EstateGoogle({Key? key}) : super(key: key);

  @override
  State<EstateGoogle> createState() => _EstateGoogleState();
}

class _EstateGoogleState extends State<EstateGoogle> {
  late GoogleMapController _controller;
  MapType _mapType = MapType.satellite;
  CameraPosition _cameraPosition = CameraPosition(target: LatLng(25.384944572534913, 97.3615129803156)
        ,zoom: 20
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: const Text("google Map")),
      body: Stack(
        children: [
          GoogleMap(
            mapType: _mapType,
            onMapCreated:(controller){
              _controller = controller;
            } ,
            myLocationButtonEnabled: true,
            initialCameraPosition: _cameraPosition),

            Positioned(

              right: 10,
              top: 10,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: (){
                        _controller.animateCamera(

                          CameraUpdate.zoomTo(100)
                        );

                    },
                     icon: Icon(Icons.add)),
                         IconButton(onPressed: (){
                            _controller.animateCamera(

                          CameraUpdate.zoomOut()
                        );
                         },
                 icon: Icon(Icons.remove))
                  ],
                ),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Container(
                color: Colors.white,
                child: IconButton(onPressed: (){
                  setState(() {
                    if(_mapType == MapType.satellite){
                      _mapType = MapType.terrain;
                    }
                   else{
                     _mapType = MapType.satellite;
                    }
                  });

                },
                 icon: (_mapType == MapType.satellite)? Icon(Icons.satellite_alt_outlined) :Icon(Icons.terrain)
            
                ),
              ),
            ),
            
        ],
      ),
    );
  }
}