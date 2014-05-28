local sha1 = require('spec.util.sha1')

describe('sha1', function()
  it('passes basic tests', function()
    assert.equal(sha1(("x"):rep(64))                                             , "bb2fa3ee7afb9f54c6dfb5d021f14b1ffe40c163")
    assert.equal(sha1("http://regex.info/blog/")                                 , "7f103bf600de51dfe91062300c14738b32725db5")
    assert.equal(sha1(string.rep("a", 10000))                                    , "a080cbda64850abb7b7f67ee875ba068074ff6fe")
    assert.equal(sha1("abc")                                                     , "a9993e364706816aba3e25717850c26c9cd0d89d")
    assert.equal(sha1("abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"), "84983e441c3bd26ebaae4aa1f95129e5e54670f1")
    assert.equal(sha1("The quick brown fox jumps over the lazy dog")             , "2fd4e1c67a2d28fced849ee1bb76e7391b93eb12")
    assert.equal(sha1("The quick brown fox jumps over the lazy cog")             , "de9f2c7fd25e1b3afad3e85a0bd17d9b100db4b3")
  end)

  it('passes random tests', function()
    assert.equal("efb750130b6cc9adf4be219435e575442ec68b7c",  sha1(string.char(136,43,218,202,158,86,64,140,154,173,20,184,170,125,37,54,208,68,171,24,164,89,142,111,148,235,187,181,122):rep(76)))
    assert.equal("432dff9d4023e13194170287103d0377ed182d96",  sha1(string.char(20,174):rep(407)))
    assert.equal("ccba5c47946530726bb86034dbee1dbf0c203e99",  sha1(string.char(20,54,149,252,176,4,96,100,223):rep(753)))
    assert.equal("4d6fea4f8576cd6648ae2d2ee4dc5df0a8309115",  sha1(string.char(118,171,221,33,54,209,223,152,35,67,88,50):rep(985)))
    assert.equal("f560412aabf813d01f15fdc6650489584aabd266",  sha1(string.char(23,85,29,13,146,55,164,14,206,196,109,183,53,92,97,123,242,220,112,15,43,113,22,246,114,29,209,219,190):rep(177)))
    assert.equal("b56795e12f3857b3ba1cbbcedb4d92dd9c419328",  sha1(string.char(21,216):rep(131)))
    assert.equal("54f292ecb7561e8ce27984685b427234c9465095",  sha1(string.char(15,205,12,181,4,114,128,118,219):rep(818)))
    assert.equal("fe265c1b5a848e5f3ada94a7e1bb98a8ce319835",  sha1(string.char(136,165,10,46,167,184,86,255,58,206,237,21,255,15,198,211,145,112,228,146,26,69,92,158,182,165,244,39,152):rep(605)))
    assert.equal("64461476eb8bba70e322e4b83db2beaee5b495d4",  sha1(string.char(33,141):rep(359)))
    assert.equal("761e44ffa4df3b4e28ca22020dee1e0018107d21",  sha1(string.char(254,172,185,30,245,135,14,5,186,42,47,22):rep(715)))
    assert.equal("41161168b99104087bae0f5287b10a15c805596f",  sha1(string.char(79):rep(625)))
    assert.equal("7088f4d88146e6e7784172c2ad1f59ec39fa7768",  sha1(string.char(20,138,80,102,138,182,54,210,38,214,125,123,157,209,215,37):rep(315)))
    assert.equal("2e498e938cb3126ac1291cee8c483a91479900c1",  sha1(string.char(140,197,97,112,205,97,134,190):rep(552)))
    assert.equal("81a2491b727ef2b46fb84e4da2ced84d43587f4e",  sha1(string.char(109,44,17,199,17,107,170,54,113,153,212,161,174):rep(136)))
    assert.equal("0e4f8a07072968fbc4fe32deccbb95f113b32df7",  sha1(string.char(181,247,203,166,34,61,180,48,46,77,98,251,72,210,217,242,135,133,38,12,177,163,249,31,1,162):rep(282)))
    assert.equal("8d15dddd48575a1a0330976b57e2104629afe559",  sha1(string.char(15,60,105,249,158,45,14,208,202,232,255,181,234,217):rep(769)))
    assert.equal("98a9dd7b57418937cbd42f758baac4754d5a4a4b",  sha1(string.char(115,121,91,76,175,110,149,190,56,178,191,157,101,220,190,251,62,41,190,37):rep(879)))
    assert.equal("578487979de082f69e657d165df5031f1fa84030",  sha1(string.char(189,240,198,207,102,142,241,154):rep(684)))
    assert.equal("3e6667b40afb6bcc052654dd64a653ad4b4f9689",  sha1(string.char(85,82,55,80,43,17,57,20,157,10,148,85,154,58,254,254,221,132,53,105,43,234,251,110,111):rep(712)))

  end)

  describe('sha1.hmac', function()

    it('passes basic tests', function()
      assert.equal("31285f3fa3c6a086d030cf0f06b07e7a96b5cbd0", sha1.hmac("63xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",   "data"))
      assert.equal("2d183212abc09247e21282d366eeb14d0bc41fb4", sha1.hmac("64xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",  "data"))
      assert.equal("ff825333e64e696fc13d82c19071fa46dc94a066", sha1.hmac("65xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", "data"))
    end)

    it('passes random tests', function()
      assert.equals("ecc8b5d3abb5182d3d570a6f060fef2ee6c11a44", sha1.hmac(string.char(220,58,17,206,77,234,240,187,69,25,179,182,186,38,57,83,120,107,198,148,234,246,46,96,83,28,231,89,3,169,42,62,125,235,137), string.char(1,225,98,83,100,71,237,241,239,170,244,215,3,254,14,24,216,66,69,30,124,126,96,177,241,20,44,3,92,111,243,169,100,119,198,167,146,242,30,124,7,22,251,52,235,95,211,145,56,204,236,37,107,139,17,184,65,207,245,101,241,12,50,149,19,118,208,133,198,33,80,94,87,133,146,202,27,89,201,218,171,206,21,191,43,77,127,30,187,194,166,39,191,208,42,167,77,202,186,225,4,86,218,237,157,117,175,106,63,166,132,136,153,243,187)))
      assert.equals("bd1577a9417d804ee2969636fa9dde838beb967d", sha1.hmac(string.char(216,76,38,50,235,99,92,110,245,5,134,195,113,7), string.char(144,3,250,84,145,227,206,87,188,42,169,182,106,31,207,205,33,76,52,158,255,49,129,169,9,145,203,225,90,228,163,33,49,99,29,135,60,112,152,5,200,121,35,77,56,116,68,109,190,136,184,248,144,172,47,107,30,16,105,232,146,137,24,81,245,94,28,76,27,82,105,146,252,219,119,164,21,14,74,192,209,208,156,56,172,124,89,218,51,108,44,174,193,161,228,147,219,129,172,210,248,239,22,11,62,128,1,50,98,233,141,224,102,152,44,68,66,46,210,114,138,113,121,90,7,70,125,191,192,222,225,200,217,48,22,10,132,29,236,71,108,140,102,96,51,142,51,220,4)))
      assert.equals("e8ddf90f0c117ee61b33db4df49d7fc31beca7f7", sha1.hmac(string.char(189,213,184,86,24,160,198,82,138,223,71,149,249,70,183,47,0,106,27,39,85,102,57,190,237,182,2,10,21,253,252,3,68,73,154,75,79,247,28,132,229,50,2,197,204,213,170,213,255,83,100,213,60,67,202,61,137,125,16,215,254,157,106,5), string.char(78,103,249,15,43,214,87,62,52,57,135,84,44,92,142,209,120,139,76,216,33,223,203,96,218,12,6,126,241,195,47,203,196,22,113,138,228,44,122,37,215,166,184,195,91,97,175,153,115,243,37,225,82,250,54,240,20,237,149,183,5,43,142,113,214,130,100,149,83,232,70,106,152,110,25,74,46,60,159,239,193,173,235,146,173,142,110,71,1,97,54,217,52,228,250,42,223,53,105,24,87,98,117,245,101,189,147,238,48,111,68,52,169,78,151,38,21,249)))
      assert.equals("e33c987c31bb45b842868d49e7636bd840a1ffd3", sha1.hmac(string.char(154,60,91,199,157,45,32,99,248,5,163,234,114,223,234,48,238,82,43,242,52,176,243,5,135,26,141,49,105,120,220,135,192,96,219,152,126,74,58,110,200,56,108,1,68,175,82,235,149,191,67,72,195,46,35,131,237,188,177,223,145,122,26,234,136,93,34,96,71,214,55,27,13,116,235,109,58,83,175,226,59,13,218,93,5,132,43,235), string.char(182,10,154)))
      assert.equals("f6039d217c16afadfcfae7c5e3d1859801a0fe22", sha1.hmac(string.char(73,120,173,165,190,159,174,100,255,56,217,98,249,11,166,25,66,95,96,99,70,73,223,132,231,147,220,151,79,102,111,98), string.char(134,93,229,103)))
      assert.equals("f6056b19cf6b070e62a0917a46f4b3aefcf6262d", sha1.hmac(string.char(49,40,62,214,208,180,147,74,162,196,193,9,118,47,100,9,235,94,3,122,226,163,145,175,233,148,251,88,49,216,208,110,13,97,255,189,120,252,223,241,55,210,77,4), string.char(92,185,37,240,36,97,21,132,188,80,103,36,162,245,63,104,19,106,242,44,96,28,197,26,46,168,73,46,76,105,30,167,101,64,67,119,65,140,177,226,223,108,206,60,59,0,182,125,42,200,101,159,109,6,62,85,67,66,88,137,92,234,61,19,22,177,144,127,129,129,195,230,180,149,128,148,45,18,94,163,196,55,70,184,251,3,200,162,16,210,188,61,186,218,173,227,212,8,125,20,138,82,68,170,24,158,90,98,228,166,246,96,74,24,217,93,91,102,246,221,121,115,157,243,45,158,45,90,186,11,127,179,59,72,37,71,148,123,62,150,114,167,248,197,18,251,92,164,158,83,129,58,127,162,181,92,85,121,13,118,250,221,220,150,231,5,230,28,213,25,251,17,71,68,234,173,10,206,111,72,123,205,49,73,62,209,173,46,94,91,151,122)))
      assert.equals("15ddfa1baa0a3723d8aff00aeefa27b5b02ede95", sha1.hmac(string.char(91,117,129,150,117,169,221,182,193,130,126,206,129,177,184,171,174,224,91,234,60,197,243,158,59,0,122,240,145,106,192,179,96,84,46,239,170,123,120,51,142,101,45,34), string.char(27,71,38,183,232,93,23,174,151,181,121,91,142,138,180,125,75,243,160,220,225,205,205,72,13,162,104,218,47,162,77,23,16,154,31,156,122,67,227,25,190,102,200,57,116,190,131,8,208,76,174,53,204,88,227,239,71,67,208,32,57,72,165,121,80,139,80,29,90,32,229,208,115,169,238,189,206,82,180,68,157,124,119,1,75,27,122,246,197,178,90,225,138,244,73,12,226,104,191,70,53,210,245,250,239,238,3,229,196,22,28,199,122,158,9,33,109,182,109,87,25,159,159,146,217,77,37,25,173,211,38,173,70,252,18,193,7,167,160,135,63,190,149,14,221,143,173,152,184,143,157,245,137,219,74,239,185,40,14,0,29,87,169,84,67,75,255,252,201,131,75,108,43,129,210,193,108,139,60,228,29,36,150,15,86)))
      assert.equals("6aa92cb64b2e390fbf04dc7edfe3af068109ffba", sha1.hmac(string.char(202,230,55,100,136,80,156,240,98,73,97,72,191,195,185,105,150,97,148,33,167,140,212,100,247,154,5,152,117,24,128,221,150,49,143,86,12,211,161,75,177,75,145,46,112,143,37,181,84,50,230,81), string.char(131,200,0,161,117,217,5,10,64,79,178,147,64,248,35,147,135,103,157,181,194,123,76,13,150,118,204,63,32,203,155,222,227,148,31,28,218,83,245,17,208,200,104,78,85,31,114,194,67,159,184,167,42,199,241,6,182,195,3,79,22,236,124)))
      assert.equals("a42cf08fa6d8ad6ae00251aeed0357dca80645c7", sha1.hmac(string.char(170,52,245,172,122,225,164,248,23,35,54,243,118,35,165,16,6), string.char(245,115,59,162,179,146,39,213,64,240,80,108,190,127,116,16,154,211,33,171,150,46,77,213,99,88,160,101,236,202,70,26,61,83,79,110,127,74,97,34,18,243,140,34,244,249,225,88,132,102,7,99,220,140,46,111,96,48,93,44,47,186,86,246,244,127,236,150,35,69,111,238,54,24,71,157,254,21,2,194,69,47,190,87,72,235,60,243,40,153,111,55,220,25,91,17,156,195,57,207,107,145,6,82,104,232,209)))
      assert.equals("8dd62dcf68ef2d193005921161341839b8cac487", sha1.hmac(string.char(136,5,195,241,18,208,11,46,252,182,96,183,164,87,248,13), string.char(78,49,162,9,47,79,26,139,66,194,248,90,171,207,167,43,201,223,102,192,49,145,83,42,1,52,250,116,216,133,224,224,17,143,41,153,65,214,231,109,160,5,31,85,17,186,199,226,214,92,21,194,148,98,68,209,50,74,26,150,97,59,223,8,131,173,145,6,31,126,248,86,226,2,94,15,3,202,239,99,177,237,61,99,14,253,26,246,0,151,2,7,159,40,249,166)))
      assert.equals("eff66e7a69ae7d2a90b2d80c64ce7c41fe560a19", sha1.hmac(string.char(123,54,89,205,103,116,21,97,164,41,23,224,151,195,22,196,90,52,253,92), string.char(141,12,168,171,49,30,165,57,107,214,157,224,36,163,182,184,103,186,133,22,2,215,52,220,95,205,231,180,221,139,67,184,21,46,172,95,183,220,31,27,227,122,183,196,114,206,132,162,51,164,84,212,172,63,218,236,127,215,218,77,119,105,14,19,164,53,149,11,13,1,29,246,69,200,208,239,154,60,245,31,172,82,158,165,197,250,151,83,12,156,215,201,66,45,238,228,77,125,157,35,235,162,78,220,132,14,137,168,238,127,10,24,41,132,181,43,95,73,33,32,129,149,145,55,80,156,171,73,90,183,166,182,163,154,31,104,14,56,59,102,72,210,121,191,251,239,1,5,76,116,158,89,40,69,220,107,23,168,106,93,92,95,21,91,118,118,71,29,64,142,84,15,153,193,47,214,30,117,236,217)))
      assert.equals("0f1adc518afcca2ed7ad0adaaedd544835ddb76e", sha1.hmac(string.char(142,36,199,16,52,54,62,146,153,25,162,85,251,247), string.char(110,70,53,237,120,53,50,196,24,82,199,210,156,178,110,124,7,24,229,89,39,1,10,96,74,211,36,79,166,4,33,238,64,220,239,129,48,232,244,172,142,79,154,73,36,107,182,208,191,25,201,19,233,23,60,236,180,76,116,53,232,181,101,62,160,252,213,171,166,113,193,73,75,13,209,63,76,92,95,176,119,0,125,174,42,138,77,23,212,81,180,10,193,118,244,242,163,246,206,150,162,92,20,208,51,71,254,197,11,222,203,153,208,251,243,193,124,141,215,171,55,244,230,78,158,32,223,138,156,43,98,39,191,108,111,6,117,130,195,100,221,233,17,98,180,49,132,139,171,20,180,7,206,35,54,17,48,253,130,185,249,2,52,17,207,73,24,33)))
      assert.equals("5e87f8d9a653312fd7b070a33a5d9e67b28b9a84", sha1.hmac(string.char(255,237,33,255,4,170,95,90,88,77,217,10,94,118,134,20,33,208,17,136,77,18,169,205,112,36,203,231,67,47,186,91,7,17,29), string.char(97,211,98,53,135,238,42,101,144,12,75,185,119,223,114,81,201,94,21,118,16,152,74,215,56,61,131,151,83,96,83,59,49,199,255,207,153,90,231,39,181,4,59,9,2,150,207,124,209,120,37,236,195,66,189,209,137,9,165,78,172,142,209,243,237,145,204,210,222,153,52,127,39,174,133,17,186,219,87,142,209,212,223,60,249,57,244,251,44,254,73,238,52,99,94,237,189,185,237,1,101,166,220,170,103,209)))
      assert.equals("837c7cc92e0d2c725b1d1d2f02ef787be37896fa", sha1.hmac(string.char(150,241,64,89,79,72,88,157,113,139,190,43,211,214,202,52,124,91,111,198,47,161,120,17,120,157,112,248,245,154,254,25,233,96,216), string.char(214,251,73,193,181,158,253,28,23,48,186,168,162,26,124,103,22,195,165,63,189,196,162,229,69,1,208,85,249,24,73,101,243,149,68,236,124,147,108,67,37,75,202,143,57,124,71,176,27,216,208,183,164,173,219,170,79,10,198,1,232,35,9,19,70,131,211,60,37,94,146,98,92,31,150,95,89,189,46,38,156,118,171,137,86,87,32,173,77,14,135,233,233,114,162,136,57,113,73,115,134,87,184)))
      assert.equals("64534553f76e55b890101380ad9149d3cacb5b76", sha1.hmac(string.char(231,24,192,54,17,14,98,122,119,170,71,54,206,207,223,109,164,181,124,186,122,111,122,34,157,24,237,130,207,206,117,76,183,162,174,124,60,60,77,114,139,170,194,143,232,74,160,141,161,171,51,178,162,159,234,208,55), string.char(141,184,241,185,112,45,53,192,72,152,139,145,146,149,145,151,12,140,111,79,158,172,212,175,75,225,127,4,252,104,5,94,105,24,141,183,79,208,240,227,63,126,213,4,13,109,216,244,237,24,196,52,212,245,147,109,18,63,69,107,122,245,101,67,212,232,92,25,135,67,127,247,187,143,224,198,105,38,147,12,238,6,57,53,105,246,0,127,222,69,163,44,11,245,82,220,32,108,33,70,93,177,89,75,192,214,104,236,84,28,221,209,27,12,80,239,111,249,57,39,236,193,17,69,66,180,63,193,242,248,72,22,225,56,198,235,111,102,33,171,159,124,220,143,108,10,71,186,219,213,28,209,145,188,36,70,59,9,235,154,57,12,211,146,6,87,83)))
      assert.equals("b7efbbc21ac1a746e22368e814ef5921056331ac", sha1.hmac(string.char(137,153,151,252,88,36,165,92,194,50,19,117), string.char(155,113,35,47,22,52,144,77,130,20,178,133,75,207,168,146,132,209,160,7,123,190,117,196,147,212,142,25,182,222,56,249,192,228,6,224,250,221,89,7,176,27,37,49,215,192,74,132,127,101,32,23,34,131,23,74,37,226,208,205,162,242,102)))
      assert.equals("950ad3222f4917f868d09feab237a909fb6d50b7", sha1.hmac(string.char(78,46,85,132,231,4,243,255,22,45,240,155,151,119,94,213,50,111,10,83,40,204,49,52,17,69,132,44,213,83,54,251,211,159,123,55,17,58,162,170,210,3,35,237,165,181,217,27,7,249,158,22,158,207,77,121,37,63,37,39,204,68,99,158,78,175,73,183,47,99,134,65,74,234,154,33,14,117,126,98,167,242,106,112,145,82), string.char(144,133,184,16,9,8,227,98,190,60,141,255,87,69,63,214,12,67,14,206,32,120,59,232,176,82,32,194,115,52,148,143,126,86,82,101,167,249,17,169,9,105,228)))
    end)
  end)
end)
