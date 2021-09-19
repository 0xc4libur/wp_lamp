sudo apt-get install libopenscap8 -y

wget https://people.canonical.com/~ubuntu-security/oval/com.ubuntu.xenial.cve.oval.xml

oscap oval eval --results /tmp/oscap_results.xml --report /tmp/oscap_report.html com.ubuntu.xenial.cve.oval.xml
