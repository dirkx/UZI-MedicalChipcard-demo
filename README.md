Two examples of an UZI test setup

 * softtoken-based -- entirely fake setup where you generate your own, fake PKI Overheid self signed root and then generate as many 'doctor' tokens as you want.

 * pass-based -- requires access to a valid UZI test pass.

= Patch OpenSSL

The patch patch-openssl-x509-uzi.diff is needed to make OpenSSL display the otherName
in SubjectAltName that contains:

	<versie-nr>-<UZI-nr>-<pastype>-<Abonnee-nr>-<rol>-<AGB-code>

Fields are defined in section 4.8.3 of the CA model, Pasmodel, Certificaat- en CRL-profielen Zorg CSP (productieomgeving) document in docs.

