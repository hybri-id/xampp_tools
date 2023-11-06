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
    This is a tool to schedule and restore the backup of XAMPP mySQL databases!
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

After searching in the net for a consistent mySQL backup tool for XAMPP I ended doing my own tool because I didn't found something that fits my needs. This tool backups all mySQL databases of XAMPP directory, then compress them in .gz format to save disk space. You can also schedule the backups and restore them with only few key presses. It has many advantages because the program is modular.

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

The program is packed under xampp_tools.exe package. You can also download .bat files alone so fit your needs.

### Prerequisites

You will need to execute mysql under XAMPP control panel first (or install it as a service so the scheduler can do the backup task).
You will also need Visual C++ Redistributables and 7z

1. Get it free at [Visual C++ Redistributables](https://learn.microsoft.com/es-es/cpp/windows/latest-supported-vc-redist?view=msvc-170)
2. Get it free at [7zip](https://www.7-zip.org/a/7z1900-x64.exe)

### Installation

You only need to download the xamp_tools.exe and copy it to your XAMPP directory. Then execute it and open scheduler, so you can follow on screen instructions to backup your database.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

* Scheduler: You can schedule backups from here, aslong as make instant backups and restores of all the databases.

_For more examples, please refer to the [Documentation]()_

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

- [x] Add htdocs backup tool
- [x] Add a feature to backup/restore single database
- [ ] Add Additional Features like make oneclick full backup or save server user/passwords in a file.
- [ ] Add "components" document to improve the readme
- [ ] Multi-language Support
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

Your Name - [@your_twitter](https://twitter.com/) - out_1990@hotmail.es

Project Link: [https://github.com/hybri-id/xampp_tools](https://github.com/hybri-id/xampp_tools)

[![LinkedIn][linkedin-shield]][linkedin-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



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
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/hybri-id/xampp_tools/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/hybri-id/xampp_tools/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=for-the-badge
[stars-url]: https://github.com/hybri-id/xampp_tools/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge
[issues-url]: https://github.com/hybri-id/xampp_tools/issues
[license-shield]: https://img.shields.io/pypi/l/sematic?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://es.linkedin.com/in/xaviouteiral
[product-screenshot]: images/screenshot.png
[Next.js]: https://img.shields.io/badge/Windows%20Terminal-%234D4D4D.svg?style=for-the-badge&logo=windows-terminal&logoColor=white
[Next-url]: https://learn.microsoft.com/es-es/windows-server/administration/windows-commands/cmd
[Net-shield]: https://img.shields.io/badge/.NET-5C2D91?style=for-the-badge&logo=.net&logoColor=white
[Net-url]: https://learn.microsoft.com/es-es/cpp/windows/latest-supported-vc-redist?view=msvc-170
