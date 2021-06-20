from pathlib import Path
from typing import Any, Dict, Optional
from pydantic import BaseSettings, PostgresDsn, validator


root_dir = Path(__file__).absolute().parent.parent


class Settings(BaseSettings):
    POSTGRES_SERVER: str
    POSTGRES_USER: str
    POSTGRES_PASSWORD: str
    POSTGRES_DB: str

    POSTGRES_URI: Optional[PostgresDsn]

    @validator('POSTGRES_URI', pre=True, allow_reuse=True)
    def assemble_db_connection(
            cls,
            v: Optional[str],
            values: Dict[str, Any],
            **kwargs) -> Any:
        if isinstance(v, str):
            return v
        return PostgresDsn.build(
            scheme='postgresql',
            user=values.get('POSTGRES_USER'),
            password=values.get('POSTGRES_PASSWORD'),
            host=values.get('POSTGRES_SERVER'),
            path=f'/{values.get("POSTGRES_DB") or ""}',
        )


settings = Settings(_env_file=Path(root_dir, '.env'))

