import 'package:flutter/material.dart';
import 'package:fromzero_app/api/profilesService.dart';
import 'package:fromzero_app/models/update_company_model.dart';
import 'package:fromzero_app/models/update_developer_model.dart';
import 'package:fromzero_app/navbar.dart';

class EditProfileWidget extends StatefulWidget {
  final String role;
  final String currentUser;

  const EditProfileWidget({
    super.key,
    required this.role,
    required this.currentUser,
  });

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  final ProfilesService _profilesService = ProfilesService();

  TextEditingController description = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController ruc = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController website = TextEditingController();
  TextEditingController profileImgUrl = TextEditingController();
  TextEditingController sector = TextEditingController();
  TextEditingController specialties = TextEditingController();

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    if (widget.role == "COMPANY") {
      final company = await _profilesService.getCompany(widget.currentUser);
      setState(() {
        description.text = company.description;
        country.text = company.country;
        ruc.text = company.ruc;
        phone.text = company.phone;
        website.text = company.website;
        profileImgUrl.text = company.profileImgUrl;
        sector.text = company.sector;
      });
    } else if (widget.role == "DEVELOPER") {
      final developer = await _profilesService.getDeveloper(widget.currentUser);
      setState(() {
        description.text = developer.description;
        country.text = developer.country;
        phone.text = developer.phone;
        specialties.text = developer.specialties;
        profileImgUrl.text = developer.profileImgUrl;
      });
    }
  }
  Future<void> _saveProfile() async {
    if (widget.role == "COMPANY") {
      final resource = UpdateCompanyProfileResource(
        description: description.text,
        country: country.text,
        ruc: ruc.text,
        phone: phone.text,
        website: website.text,
        profileImgUrl: profileImgUrl.text,
        sector: sector.text,
      );
      await _profilesService.editCompanyProfile(widget.currentUser, resource);
    } else if (widget.role == "DEVELOPER") {
      final resource = UpdateDeveloperProfileResource(
        description: description.text,
        country: country.text,
        phone: phone.text,
        specialties: specialties.text,
        profileImgUrl: profileImgUrl.text,
      );
      await _profilesService.editDeveloperProfile(widget.currentUser, resource);
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Navbar(),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Changes saved')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 4.0,
                alignment: WrapAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(profileImgUrl.text),
                  ),
                  TextFormField(
                    controller: profileImgUrl,
                    decoration: InputDecoration(labelText: "Profile Image URL"),
                    keyboardType: TextInputType.text,
                  )
                ],
              ),
              const SizedBox(height: 20),
              _buildProfileForm(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isEditing = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF004CFF),
                    ),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _saveProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF004CFF),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileForm() {
    if (widget.role == "COMPANY") {
      return Column(
        children: [
          _buildTextField("Description", description),
          _buildTextField("Country", country),
          _buildTextField("RUC", ruc),
          _buildTextField("Phone", phone),
          _buildTextField("Website", website),
          _buildTextField("Sector", sector),
        ],
      );
    } else if (widget.role == "DEVELOPER") {
      return Column(
        children: [
          _buildTextField("Description", description),
          _buildTextField("Country", country),
          _buildTextField("Phone", phone),
          _buildTextField("Specialties", specialties),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}