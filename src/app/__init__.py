import importlib.metadata

from .main import MainClass

__all__ = ["MainClass"]

__version__ = importlib.metadata.version(__package__)
