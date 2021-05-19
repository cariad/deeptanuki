# deeptanuki: My local AWS DeepRacer training setup

This project will configure a fresh Ubuntu Desktop 20.04 LTS installation to enable AWS DeepRacer training.

In brief, it will install and configure:

- AWS CLI
- CUDA toolkit
- NVIDIA drivers
- Docker, with NVIDIA container toolkit
- [mattcamp/deepracer-local](https://github.com/mattcamp/deepracer-local) -- Thank you, [mattcamp](https://github.com/mattcamp)! ❤️

This setup fits my way of working, but it might not be right for you. My development machine is not the same as my training machine. This project assumes that model metadata, reward functions and training parameters will be developed off of the training machine, and copied-in via git.

## Installation

1. Fork [cariad/deepracer-sample](https://github.com/cariad/deepracer-sample). Make it private if you want to protect your secret sauce. _Skip this step if you just want to see some basic training happening._
1. Install Ubuntu Desktop 20.04 LTS on your training machine. [I installed it on an external SSD](https://blog.cariad.io/2021/05/local-deepracer-training-part-1-installing-ubuntu-on-an-external-ssd/).
1. In Ubuntu, clone this project into `~/.deeptanuki`:

    ```bash
    git clone https://github.com/cariad/deeptanuki.git  ~/.deeptanuki
    ```

1. Edit `~/.deeptanuki/config.env`:

| Name               | Description |
|--------------------|----------------------------------------|
| `MY_TRAINING_REPO` | URL to your fork of the training repository.<br /><br />Leave it at the default `https://github.com/cariad/deepracer-sample.git` to just see a simple example running. |

1. Run `setup.sh`:

    ```bash
    cd ~/.deeptanuki
    ./setup.sh
    ```

## Training

1. **On your development machine:** update the [mattcamp/deepracer-local](https://github.com/mattcamp/deepracer-local) `config.env`, model metadata, reward function and training parameters in your fork of the training repository.
1. **On your training machine:** run `update-training.sh` to pull your files and copy them into the correct local locations.
1. **On your training machine:** run the [mattcamp/deepracer-local](https://github.com/mattcamp/deepracer-local) scripts as you normally would in `~/.deeptanuki/deepracer-local`.

## Hey there!

My name is **Cariad**, and I'm an [independent freelance DevOps engineer](https://cariad.io).

I'd love to spend more time working on projects like this, but--as a freelancer--my income is sporadic and I need to chase gigs that pay the rent. If this project has value to you, please consider [☕️ sponsoring](https://github.com/sponsors/cariad) me.

Thank you! ❤️
