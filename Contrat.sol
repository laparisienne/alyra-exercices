pragma solidity ^0.5.16;
contract PlaceMarche {
    
    // Les differentes declarations
    address administrateur;
 
    struct Participant {
        string nom;
        address adresse;
        uint reputation;
        bool estvalide;
    }
    
    mapping(address=>Participant)participants;
    mapping(address=>bool)bannies;
    
     //===Modification =========
    modifier notBannie(address _adresse)  {
        require( bannies[_adresse] == false,"vous êtes bannie");
        _;
    }
    modifier OnlyAdmin(){
        require(msg.sender==administrateur);
        _;
    }
    modifier notInscrit(address _adresseParticip) {
        require(!participants[_adresseParticip].estvalide,"vous êtes inscrit ");
        _;
    }
    
    modifier EstInscrit(address _adresseParticip) {
        require(participants[_adresseParticip].estvalide,"vous n'êtes pas inscrit ");
        _;
    }
    // ======constructor========
    
    constructor() public {
        administrateur =msg.sender;
    }
    
    //======Inscription=====
    
    /*-*
    -* Inscription d'un participant avec une réputation est mise à 1 au minimum
    -*/ 
    function inscription(string memory _nom, address _adresse)public notBannie(_adresse) notBannie(_adresse) {
        
         participants[msg.sender] = Participant(_nom,_adresse,1,true);
        
    }
    /*-*
    -* Bannir un Participant avec une réputation qui est mise à 0;
    */
    
    function bannirParticipant(address _adresse) public EstInscrit(_adresse) notBannie(_adresse) OnlyAdmin {
        participants[_adresse].reputation = 0;
        bannies[_adresse] = true;
        
    }
}