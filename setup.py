import controller

with open("README.md", "r") as fh:
	long_description = fh.read()

controller.setup(
	name="minecraft-controller",
	version="", 	# TODO: Change version number
	author="Perry Bunn",
    author_email="author@example.com",
    description="A Minecraft automation package because I was lazy and you are too",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/perryBunn/minecraft-automation",
    packages=controller.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: GNU General Public License",
        "Operating System :: Debian/Ubuntu",
    ],
    python_requires='>=3.6',
)