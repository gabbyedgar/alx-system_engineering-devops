<h1 class="gap">0x07. Networking basics #0</h1>


<h4 class="task">
    0. OSI model
      <span class="alert alert-warning mandatory-optional">
        mandatory
      </span>
</h4><p>OSI (Open Systems Interconnection) is an abstract model to describe layered communication and computer network design. The idea is to segregate the different parts of what make communication possible.</p><p>It is organized from the lowest level to the highest level:</p><ul>
<li>The lowest level: layer 1 which is for transmission on physical layers with electrical impulse, light or radio signal</li>
<li>The highest level: layer 7 which is for application specific communication like SNMP for emails, HTTP for your web browser, etc</li>
</ul><p>Keep in mind that the OSI model is a concept, it’s not even tangible. The OSI model doesn’t perform any functions in the networking process.
It is a conceptual framework so we can better understand complex interactions that are happening.
Most of the functionality in the OSI model exists in all communications systems.</p><p><img alt="OSI model" src="http://i.imgur.com/YcSDAhS.png"/></p><p>In this project we will mainly focus on:</p><ul>
<li>The Transport layer and especially TCP/UDP</li>
<li>On the Network layer with IP and ICMP</li>
</ul><p>The image bellow describes more concretely how you can relate to every level.</p><p><img alt="OSI model with actual application" src="http://i.imgur.com/AJDRNea.jpg"/></p><p>Questions:</p><p>What is the OSI model?</p><ol>
<li>Set of specifications that network hardware manufacturers must respect</li>
<li>The OSI model is a conceptual model that characterizes the communication functions of a telecommunication system without regard to their underlying internal structure and technology</li>
<li>The OSI model is a model that characterizes the communication functions of a telecommunication system with a strong regard to their underlying internal structure and technology</li>
</ol><p>How is the OSI model organized?</p><ol>
<li> Alphabetically</li>
<li>From the lowest to the highest level</li>
<li>Randomly</li>
</ol>


<h4 class="task">
    1. Types of network
      <span class="alert alert-warning mandatory-optional">
        mandatory
      </span>
</h4><p><img alt="LAN, WAN and Internet schema" src="http://i.imgur.com/kbaNEA1.jpg"/></p><p>LAN connect local devices together, WAN connects LANs together, and WANs are operating over the Internet.</p><p>Questions:</p><p>On what type of network are Holberton iMacs connected to?</p><ol>
<li>Internet</li>
<li>WAN</li>
<li>LAN</li>
</ol><p>What type of network could connect the Holberton HQ office with the Holberton-Gandi office?</p><ol>
<li>Internet</li>
<li>WAN</li>
<li>LAN</li>
</ol><p>What network do you use when you browse www.holbertonschool.com from your smartphone (not connected to the Wifi)?</p><ol>
<li>Internet</li>
<li>WAN</li>
<li>LAN</li>
</ol>


<h4 class="task">
    2. MAC and IP address
      <span class="alert alert-warning mandatory-optional">
        mandatory
      </span>
</h4><p><img alt="Network device with MAC address visible" src="http://i.imgur.com/YWtKMUr.jpg"/></p><p>Questions:</p><p>What is a MAC address?</p><ol>
<li>The name of a network interface</li>
<li>The unique identifier of a network interface</li>
<li>A network interface</li>
</ol><p>What is an IP address?</p><ol>
<li>Is to devices connected to a network what postal address is to houses</li>
<li>The unique identifier of a network interface</li>
<li>Is a number that network devices use to connect to networks</li>
</ol>


<h4 class="task">
    3. UDP and TCP
      <span class="alert alert-warning mandatory-optional">
        mandatory
      </span>
</h4><p><img alt="Comparing TCP and UDP to a worker sending actual packages on a conveyor belt" src="http://i.imgur.com/bg9rSUy.jpg"/></p><p>Let’s fill the empty parts in the drawing above.</p><p>Questions:</p><ul>
<li>Which statement is correct for the TCP box:

<ol>
<li><code>Is a protocol that is transferring data in a slow way but surely</code></li>
<li><code>Is a protocol that is transferring data in a fast way and might loss data along in the process</code></li>
</ol></li>
<li>Which statement is correct for the UDP box:

<ol>
<li><code>Is a protocol that is transferring data in a slow way but surely</code></li>
<li><code>Is a protocol that is transferring data in a fast way and might loss data along in the process</code></li>
</ol></li>
<li>Which statement is correct for the TCP worker:

<ol>
<li><code>Have you received boxes x, y, z?</code></li>
<li><code>May I increase the rate at which I am sending you boxes?</code></li>
</ol></li>
</ul>


<h4 class="task">
    4. TCP and UDP ports
      <span class="alert alert-warning mandatory-optional">
        mandatory
      </span>
</h4><p>Once packets have been sent to the right network device using IP using either UDP or TCP as a mode of transportation, it needs to actually enter the network device.</p><p>If we continue the comparison of a network device to your house, where IP address is like your postal address, UDP and TPC ports are like the windows and doors of your place. A TCP/UDP network device has 65535 ports. Some of them are officially reserved for a specific usage, some of them are know to be used for a specific usage (but nothing officially declared) and the rest are free of use.</p><p>While the full list of ports should not be memorized, it is important to know the most used ports, let’s start by remembering 3 of them:</p><ul>
<li><strong>22</strong> for SSH</li>
<li><strong>80</strong> for HTTP</li>
<li><strong>443</strong> for HTTPS</li>
</ul><p>Note that a specific <a href="/rltoken/U8jImiUjsUDcRu5bEno4tA" target="_blank" title="IP + port = socket">IP + port = socket</a>.</p><p>Write a Bash script that displays listening ports:</p><ul>
<li>That only shows listening sockets</li>
<li>That shows the PID and name of the program to which each socket belongs</li>
</ul><p>Example:</p>


<h4 class="task">
    5. Is the host on the network
      <span class="alert alert-warning mandatory-optional">
        mandatory
      </span>
</h4><p><img alt="Ping pong while wakeboarding" src="https://media.giphy.com/media/uDxkJAVSU7GY8/giphy.gif"/></p><p>The Internet Control Message Protocol (ICMP) is a protocol in the Internet protocol suite. It is used by network devices, to check if other network devices are available on the network. The command <code>ping</code> is using ICMP to make sure that a network device remains online or to troubleshoot issues on the network. </p><p>Write a Bash script that pings an IP address passed as an argument.</p><p>Requirements: </p><ul>
<li>Accepts a string as an argument</li>
<li>Displays <code>Usage: 5-is_the_host_on_the_network {IP_ADDRESS}</code> if no argument passed</li>
<li>Ping the IP 5 times</li>
</ul><p>Example:</p>

