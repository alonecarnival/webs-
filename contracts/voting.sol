pragma solidity ^0.5.0;
contract Voting {


  mapping (bytes32 => uint8) public votesReceived;//the total count of someone

  //someone have voted of not
  mapping (address=>bool) public voters;
  mapping (address=>bool) public register;
  mapping (address=>string) public voteData;

  string[] public candidateList;
  bytes32[] public registerIdList;

  string ProjectName;
  string RegisterStartTime = "2023-07-3 21:00";
  string RegisterEndTime = "2023-07-4 21:00";
  string VoteStartTime ="2023-07-4 21:00";
  string VoteEndTime = "2023-07-4 21:00";
  string PrivateKey;

  uint8 registerCount = 0;
  uint8 voteCount = 0;

  constructor() public {
    //candidateList.push("cen");
    //candidateList.push("hui");
    //candidateList.push("feng");
    //registerIdList.push(22213);
    //registerIdList.push(6666666);
    //registerIdList.push(1232414);
  }

  function projectSetup(string memory title, string memory select_a, string memory select_b, string memory select_c) public{
      ProjectName = title;
      candidateList=[select_a, select_b, select_c];
  }

  function registerIdSetup(bytes32 register_a, bytes32 register_b, bytes32 register_c, bytes32 register_d,
      bytes32 register_e, bytes32 register_f, bytes32 register_g, bytes32 register_h) public{
      registerIdList.push(register_a);
      registerIdList.push(register_b);
      registerIdList.push(register_c);
      registerIdList.push(register_d);
      registerIdList.push(register_e);
      registerIdList.push(register_f);
      registerIdList.push(register_g);
      registerIdList.push(register_h);
  }

  function TimeSetSetup(string memory register_start_time,string memory register_end_time, string memory vote_start_time, string memory vote_end_time) public{
    RegisterStartTime = register_start_time;
    RegisterEndTime = register_end_time;
    VoteStartTime = vote_start_time;
    VoteEndTime = vote_end_time;
  }

  function getProjectName() public view returns (string memory){
    return ProjectName;
  }

  function getRegisterStartTime() public view returns (string memory){
    return RegisterStartTime;
  }

  function getRegisterEndTime() public view returns (string memory){
    return RegisterEndTime;
  }

  function  getVoteStartTime() public view returns (string memory){
    return VoteStartTime;
  }

  function getVoteEndTime() public view returns (string memory){
    return VoteEndTime;
  }

  function getCandidateList(uint index) public view returns (string memory){
    return candidateList[index];
  }

  function getRegisterCount() public view returns (uint8){
      return registerCount;
  }

  function getVoteCount() public view returns (uint8){
      return voteCount;
  }

  function getVoteData() public view returns (string memory){
      return voteData[msg.sender];
  }


  //得到所有注册人
  function totalVotesFor(bytes32 candidate) view public returns (uint8) {
    //require(validCandidate(candidate));//the candidate is true
    return votesReceived[candidate];
  }

  //投票给某个人，写某个人已经被投票了
  function voteForCandidate(bytes32 candidate) public {

    votesReceived[candidate] += 1;

  }

  function voteDataStore(string memory candidate) public {
    //require(!register[msg.sender]);
    require(!voters[msg.sender]);
    //require(validCandidate(candidate));//the candidate is true

    //记录用户已经投票了
    voters[msg.sender] = true;
    voteData[msg.sender] = candidate;
    voteCount += 1;
  }

  //注册
  function someoneRegister(bytes32 registerId) public{
      for(uint i = 0; i < registerIdList.length; i++){
          if(registerIdList[i] == registerId){
            register[msg.sender] = true;
            registerIdList[i] = "0x0";
            registerCount += 1;
          }
      }
  }

  //判断是否注册
  function VaildID() public view  returns (bool) {
      if(register[msg.sender]) {
          return true;
      }
      return false;
  }

  //判断是否投票
  function isVoted() public view returns (bool) {
      if(voters[msg.sender]) {
          return true;
      }
      return false;
  }

  //储存密匙
  function doGenerate(string memory privatekey) public{
      PrivateKey = privatekey;
  }

  //获得密匙
  function getPrivateKey() public view returns (string memory){
      return PrivateKey;
  }

}
