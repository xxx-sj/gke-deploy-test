import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    const test = process.env['AD_USER'];
    return `Hello World! changed! ㅠㅠㅠ ${test}`;
  }
}
