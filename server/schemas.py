from pydantic import BaseModel
from typing import List, Optional

class OCRRequest(BaseModel):
    raw_text: str

class PillDetail(BaseModel):
    name: str
    ingredient: str
    effect: str
    side_effects: List[str]
    is_dangerous: bool = False

class AnalysisResponse(BaseModel):
    pills: List[PillDetail]
    warning_message: Optional[str] = None