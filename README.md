<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/hybri-id/xampp_tools">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Xampp_Tools (Windows)</h3>

  <p align="center">
    This is a tool to schedule and restore the backup of XAMPP MySQL databases!
    <br />
    <a target="_blank" href="https://github.com/hybri-id/xampp_tools/releases/download/xampp_tools_v1.0/xampp_tools.exe">
    <br />
    <img src="https://img.shields.io/badge/DOWNLOAD-blue" alt="Download" width="190" height="60">
    </a>
    <br />
    <a href="https://github.com/hybri-id/"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/hybri-id/xampp_tools/tree/main/images">Screenshots</a>
    ·
    <a href="https://github.com/hybri-id/xampp_tools/issues">Report Bug</a>
    ·
    <a href="https://github.com/hybri-id/xampp_tools/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://github.com/hybri-id/xampp_tools/tree/main/images)

After searching in the net for a consistent SQL backup tool for XAMPP I ended doing my own tool because I haven't found something that fits my needs. This tool backups all SQL databases of a XAMPP installation, then compress them in .gz format to save disk space. You can also schedule the backups and restore them with only few key presses. It has many advantages because the scripts are modular and designed to work with XAMPP.

Here's why:
* Your time should be focused on make something else than backup manually your databases with phpMyAdmin. A project that solves a problem, saves time and helps others.
* You shouldn't be doing the same tasks over and over again.
* You should make a backup of htdocs aswell, so you can restore full server saving so much time/disk space :smile:

Of course, maybe this project is in beta stage and maybe doesn't fit your project since your needs may be different. So I'll be adding more features in the near future. You may also suggest changes by forking this repo and creating a pull request or opening an issue. Thanks to all the people have contributed to expanding this project!

Use the `README.md` to get started.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

This section list frameworks/libraries used to bootstrap the project.

* [![Batch scripting][Next.js]][Next-url]
* [![Net Framework][Net-shield]][Net-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

The program is packed under xampp_tools.exe package. You can also download .bat files alone to fit your needs, they work standalone aswell.

### Prerequisites

You will need to install XAMPP first (and install MySQL as a service so the scheduler can do the backup task).
You will also need Visual C++ Redistributables and 7z for database compression.

1. Get it free at [Visual C++ Redistributables](https://learn.microsoft.com/es-es/cpp/windows/latest-supported-vc-redist?view=msvc-170)
2. Get it free at [7zip](https://www.7-zip.org/a/7z1900-x64.exe)

### Installation

1. Download the xamp_tools.exe and copy/move it to your main XAMPP directory (ex. "C:\xampp"). 
2. Open it, so you can follow on screen instructions to backup/restore your databases.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

* Scheduler: You can schedule SQL backups from here, as long as make instant backups and restore all the databases.

_For more examples, please refer to the [Documentation]()_

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

- [X] Add compression to the database's backup to save space.
- [X] Add log files to the restore database script.
- [ ] Add a feature to backup/restore a single database.
- [ ] Add htdocs backup tool.
- [ ] Add additional features like export server's user/passwords to a file, or improve the task scheduler.
- [ ] Add "components" document to improve the readme.
- [ ] Multi-language Support
    - [x] English
    - [ ] Chinese
    - [ ] Spanish

See the [open issues](https://github.com/hybri-id/xampp_tools/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/XToolFeature`)
3. Commit your Changes (`git commit -m 'Add some XToolFeature'`)
4. Push to the Branch (`git push origin feature/XToolFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the Apache 2.0 License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Hibri-id - out_1990@hotmail.es


[![LinkedIn][linkedin-shield]][linkedin-url]

Project Link: [https://github.com/hybri-id/xampp_tools](https://github.com/hybri-id/xampp_tools)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

[![trophy](https://github-profile-trophy.vercel.app/?username=hybri-id&theme=darkhub&no-frame=true)](https://github.com/hybri-id)


<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Use this space to list resources you find helpful and would like to give credit to. I've included a few of my favorites to kick things off!

* [Choose an Open Source License](https://choosealicense.com)
* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
* [Malven's Flexbox Cheatsheet](https://flexbox.malven.co/)
* [Malven's Grid Cheatsheet](https://grid.malven.co/)
* [Img Shields](https://shields.io)
* [GitHub Pages](https://pages.github.com)
* [Font Awesome](https://fontawesome.com)
* [React Icons](https://react-icons.github.io/react-icons/search)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/hybri-id/xampp_tools.svg?style=for-the-badge
[contributors-url]: https://github.com/hybri-id/xampp_tools/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/hybri-id/xampp_tools.svg?style=for-the-badge
[forks-url]: https://github.com/hybri-id/xampp_tools/network/members
[stars-shield]: https://img.shields.io/github/stars/hybri-id/xampp_tools.svg?style=for-the-badge
[stars-url]: https://github.com/hybri-id/xampp_tools/stargazers
[issues-shield]: https://img.shields.io/github/issues/hybri-id/xampp_tools.svg?style=for-the-badge
[issues-url]: https://github.com/hybri-id/xampp_tools/issues
[license-shield]: https://img.shields.io/github/license/hybri-id/xampp_tools.svg?style=for-the-badge
[license-url]: https://github.com/hybri-id/xampp_tools/blob/master/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://es.linkedin.com/in/xaviouteiral
[product-screenshot]: images/screenshot.png
[Next.js]: https://img.shields.io/badge/Windows%20Terminal-%234D4D4D.svg?style=for-the-badge&logo=windows-terminal&logoColor=white
[Next-url]: https://learn.microsoft.com/es-es/windows-server/administration/windows-commands/cmd
[Net-shield]: https://img.shields.io/badge/.NET-5C2D91?style=for-the-badge&logo=.net&logoColor=white
[Net-url]: https://learn.microsoft.com/es-es/cpp/windows/latest-supported-vc-redist?view=msvc-170
