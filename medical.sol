// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MedicalHistory {

    // Struct to store patient's medical information
    struct Patient {
        string name;             // Patient's name
        uint age;                // Patient's age
        string[] gender;         // Patient's gender
        string[] conditions;     // Health conditions
        string[] allergies;      // Allergies
        string[] medications;    // Medications
        string[] procedures;     // Medical procedures
    }

    // Mapping to link patient addresses with their data
    mapping(address => Patient) public patients;

    // Function to add a new patient's medical information
    function addPatient(
        string memory _name,
        uint _age,
        string[] memory _gender,
        string[] memory _conditions,
        string[] memory _allergies,
        string[] memory _medications,
        string[] memory _procedures
    ) public {
        // Create a new patient with provided data
        Patient memory patient = Patient({
            name: _name,
            age: _age,
            gender: _gender,
            conditions: _conditions,
            allergies: _allergies,
            medications: _medications,
            procedures: _procedures
        });
        // Store patient's data linked to their address
        patients[msg.sender] = patient;
    }

    // Function to update a patient's health information
    function updatePatient(
        string[] memory _conditions,
        string[] memory _allergies,
        string[] memory _medications,
        string[] memory _procedures
    ) public {
        // Access the patient's information via their address
        Patient storage patient = patients[msg.sender];
        // Update the health information with new data
        patient.conditions = _conditions;
        patient.allergies = _allergies;
        patient.medications = _medications;
        patient.procedures = _procedures;
    }

    // Function to retrieve a patient's details by providing their address
    function getMedicalDetails(address _patientAddress) public view returns (
        string memory,  // Patient's name
        uint,           // Patient's age
        string[] memory,  // Health conditions
        string[] memory,  // Allergies
        string[] memory,  // Medications
        string[] memory   // Medical procedures
    ) {
        // Get the patient's information using the provided address
        Patient memory patient = patients[_patientAddress];
        // Return the patient's details as a tuple
        return (
            patient.name,
            patient.age,
            patient.conditions,
            patient.allergies,
            patient.medications,
            patient.procedures
        );
    }
}
