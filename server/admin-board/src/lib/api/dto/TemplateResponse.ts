export interface Template {
  id: string;
  projectId?: string | null;
  name: string;
  description: string;
  createdAt: string;
  steps: TemplateStep[];
}

export interface TemplateStep {
  id: string;
  name: string;
  position: number;
  duration: number;
  media?: any;
}

export interface TemplateDto {
  name: string;
  description: string;
  projectId?: string | null;
}

export interface EditTemplateDto {
  name: string;
  description: string;
  steps: TemplateStep[];
}
